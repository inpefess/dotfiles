(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(before-save-hook (quote (py-isort-before-save)))
 '(company-auto-complete t)
 '(company-backends
   (quote
    (company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
		  (company-dabbrev-code company-gtags company-etags company-keywords)
		  company-oddmuse company-dabbrev company-jedi)))
 '(counsel-mode t)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(default-frame-alist
    (quote
     ((width . 79)
      (height . 48)
      (vertical-scroll-bars)
      (top . 0)
      (left . 400))))
 '(disable-mouse-global-mode t nil (disable-mouse))
 '(ediff-highlight-all-diffs nil)
 '(ediff-split-window-function (quote split-window-vertically))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(ein:completion-backend (quote ein:use-company-backend))
 '(ein:notebook-modes (quote (ein:notebook-python-mode)))
 '(elpy-mode-hook (quote (flycheck-mode)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-sane-defaults)))
 '(eshell-rc-script "~/.bash_profile")
 '(fill-column 69)
 '(ivy-mode t)
 '(menu-bar-mode nil)
 '(osx-clipboard-mode t)
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (exec-path-from-shell disable-mouse ein osx-clipboard ws-butler smartparens flycheck company-jedi docker py-isort counsel-projectile counsel dockerfile-mode pipenv realgud yaml-mode magit projectile markdown-mode)))
 '(pipenv-projectile-after-switch-function (quote pipenv-projectile-after-switch-custom))
 '(projectile-completion-system (quote ivy))
 '(projectile-mode t nil (projectile))
 '(projectile-project-search-path (quote ("~/projects")))
 '(python-check-command "pylint")
 '(python-shell-completion-native-enable nil)
 '(realgud:pdb-command-name "python -m pdb")
 '(save-place-mode t)
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "nil" :family "Menlo")))))

;; projects
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; git
(global-set-key (kbd "C-x g") 'magit-status)
;; docker
(global-set-key (kbd "C-c d") 'docker)
;; python
(elpy-enable)
;; debugger
(require 'realgud)
;; pipenv
(add-hook 'python-mode-hook #'pipenv-mode)
;; static code analysis
(add-hook 'python-mode-hook 'jedi:setup)
;; smart parentheses
(smartparens-global-mode)
;; trim trailing whitespaces
(ws-butler-global-mode)
;; swiper
(global-set-key (kbd "C-s") 'swiper)
;; projectile customisation
(defun pipenv-projectile-after-switch-custom ()
  "Activate pipenv, pyvenv and set PYTHONPATH"
  ;; Always clean up, in case we were in a Python project previously.
  (pipenv-deactivate)
  ;; Only activate if we can verify this is a Pipenv project.
  (when (pipenv-project?)
    (pipenv-activate)
    (setenv "PYTHONPATH" (pipenv-project-p))
  )
)
;; fix PATH for MacOS
(exec-path-from-shell-initialize)
