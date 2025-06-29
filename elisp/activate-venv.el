;;; activate-venv --- Helper function to activate Python venv
;;; Commentary:
;;; Adds `.venv/bin` from current project to PATH and removes
;;; one previously added if any
;;; Code:
(use-package f)
(defun activate-venv(dir)
  "Activate Python virtual environment.
If it exists in `.venv` sub-directory of DIR."
  (if (project-current)
      (let ((old-venv-bin-dir
             (f-join (project-root (project-current)) ".venv" "bin")))
        (when (f-directory-p old-venv-bin-dir)
          (let ((paths (split-string (getenv "PATH") ":")))
            (when (string-equal old-venv-bin-dir (car paths))
              (pop paths)
              (setenv "PATH" (mapconcat #'identity paths ":")))
            (when (string-equal old-venv-bin-dir (car exec-path))
              (pop exec-path))))))
  (let ((venv-bin-dir (f-join dir ".venv" "bin")))
    (when (f-directory-p venv-bin-dir)
      (push venv-bin-dir exec-path)
      (setenv "PATH" (concat venv-bin-dir ":" (getenv "PATH"))))))
(provide 'activate-venv)
;;; activate-venv.el ends here
