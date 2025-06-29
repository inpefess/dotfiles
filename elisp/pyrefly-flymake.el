;;; pyrefly-flymake.el --- A pyrefly Flymake backend  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Based on the annotated example from Flymake info. To start using:
;;; (add-hook 'python-mode-hook 'pyrefly-setup-flymake-backend)
;;; Code:
(require 'cl-lib)
(defvar-local pyrefly--flymake-proc nil)

(defun pyrefly-flymake (report-fn &rest _args)
  "Report pyrefly diagnostic with REPORT-FN."
  ;; Not having pyrefly installed is a serious problem which should cause
  ;; the backend to disable itself, so an error is signaled.
  ;;
  (unless (executable-find
           "pyrefly") (error "Cannot find pyrefly"))
  ;; If a live process launched in an earlier check was found, that
  ;; process is killed.  When that process's sentinel eventually runs,
  ;; it will notice its obsoletion, since it have since reset
  ;; `pyrefly-flymake-proc' to a different value
  ;;
  (when (process-live-p pyrefly--flymake-proc)
    (kill-process pyrefly--flymake-proc))

  ;; Save the current buffer, the narrowing restriction, remove any
  ;; narrowing restriction.
  ;;
  (let ((source (current-buffer)))
    (save-restriction
      (widen)
      ;; Reset the `pyrefly--flymake-proc' process to a new process
      ;; calling the pyrefly tool.
      ;;
      (setq
       pyrefly--flymake-proc
       (make-process
        :name "pyrefly-flymake" :noquery t :connection-type 'pipe
        ;; Make output go to a temporary buffer.
        ;;
        :buffer (generate-new-buffer " *pyrefly-flymake*")
        :command
        (append
         '("pyrefly" "check" "--output-format" "min-text" "--no-summary")
         (list buffer-file-name))
        :sentinel
        (lambda (proc _event)
          ;; Check that the process has indeed exited, as it might
          ;; be simply suspended.
          ;;
          (when (memq (process-status proc) '(exit signal))
            (unwind-protect
                ;; Only proceed if `proc' is the same as
                ;; `pyrefly--flymake-proc', which indicates that
                ;; `proc' is not an obsolete process.
                ;;
                (if (with-current-buffer source (eq proc pyrefly--flymake-proc))
                    (with-current-buffer (process-buffer proc)
                      (goto-char (point-min))
                      ;; Parse the output buffer for diagnostic's
                      ;; messages and locations, collect them in a list
                      ;; of objects, and call `report-fn'.
                      ;;
                      (cl-loop
                       while (search-forward-regexp
                              "^\\([A-Z]+\\) .+\.py:\\([0-9]+\\):[0-9]+\-[0-9]+: \\(.*\\)$"
                              nil t)
                       for msg = (match-string 3)
                       for (beg . end) = (flymake-diag-region
                                          source
                                          (string-to-number (match-string 2)))
                       for type = (if (equal "ERROR" (match-string 1))
                                      :error
                                    :warning)
                       when (and beg end)
                       collect (flymake-make-diagnostic source
                                                        beg
                                                        end
                                                        type
                                                        msg)
                       into diags
                       finally (funcall report-fn diags)))
                  (flymake-log :warning "Canceling obsolete check %s"
                               proc))
              ;; Cleanup the temporary buffer used to hold the
              ;; check's output.
              ;;
              (kill-buffer (process-buffer proc)))))))
      ;; Send the buffer contents to the process's stdin, followed by
      ;; an EOF.
      ;;
      (process-send-region pyrefly--flymake-proc (point-min) (point-max))
      (process-send-eof pyrefly--flymake-proc))))

(defun pyrefly-setup-flymake-backend ()
  "Setup pyrefly as Flymake backend."
  (add-hook 'flymake-diagnostic-functions 'pyrefly-flymake nil t))
(provide 'pyrefly-flymake)
;;; pyrefly-flymake.el ends here
