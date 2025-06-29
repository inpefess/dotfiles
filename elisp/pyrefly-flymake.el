;;; ruby-flymake.el --- A ruby Flymake backend  -*- lexical-binding: t; -*-
(require 'cl-lib)
(defvar-local ruby--flymake-proc nil)

(defun ruby-flymake (report-fn &rest _args)
  ;; Not having a ruby interpreter is a serious problem which should cause
  ;; the backend to disable itself, so an error is signaled.
  ;;
  (unless (executable-find
           "ruby") (error "Cannot find a suitable ruby"))
  ;; If a live process launched in an earlier check was found, that
  ;; process is killed.  When that process's sentinel eventually runs,
  ;; it will notice its obsoletion, since it have since reset
  ;; `ruby-flymake-proc' to a different value
  ;;
  (when (process-live-p ruby--flymake-proc)
    (kill-process ruby--flymake-proc))

  ;; Save the current buffer, the narrowing restriction, remove any
  ;; narrowing restriction.
  ;;
  (let ((source (current-buffer)))
    (save-restriction
      (widen)
      ;; Reset the `ruby--flymake-proc' process to a new process
      ;; calling the ruby tool.
      ;;
      (setq
       ruby--flymake-proc
       (make-process
        :name "ruby-flymake" :noquery t :connection-type 'pipe
        ;; Make output go to a temporary buffer.
        ;;
        :buffer (generate-new-buffer " *ruby-flymake*")
        :command '("ruby" "-w" "-c")
        :sentinel
        (lambda (proc _event)
          ;; Check that the process has indeed exited, as it might
          ;; be simply suspended.
          ;;
          (when (memq (process-status proc) '(exit signal))
            (unwind-protect
                ;; Only proceed if `proc' is the same as
                ;; `ruby--flymake-proc', which indicates that
                ;; `proc' is not an obsolete process.
                ;;
                (if (with-current-buffer source (eq proc ruby--flymake-proc))
                    (with-current-buffer (process-buffer proc)
                      (goto-char (point-min))
                      ;; Parse the output buffer for diagnostic's
                      ;; messages and locations, collect them in a list
                      ;; of objects, and call `report-fn'.
                      ;;
                      (cl-loop
                       while (search-forward-regexp
                              "^\\(?:.*.rb\\|-\\):\\([0-9]+\\): \\(.*\\)$"
                              nil t)
                       for msg = (match-string 2)
                       for (beg . end) = (flymake-diag-region
                                          source
                                          (string-to-number (match-string 1)))
                       for type = (if (string-match "^warning" msg)
                                      :warning
                                    :error)
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
      (process-send-region ruby--flymake-proc (point-min) (point-max))
      (process-send-eof ruby--flymake-proc))))

(defun ruby-setup-flymake-backend ()
  (add-hook 'flymake-diagnostic-functions 'ruby-flymake nil t))

(add-hook 'ruby-mode-hook 'ruby-setup-flymake-backend)
