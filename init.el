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
     ((width . 80)
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
 '(eshell-rc-script "~/.zshenv")
 '(exec-path-from-shell-variables (quote ("PATH" "MANPATH" "LC_ALL" "LANG")))
 '(explicit-shell-file-name "/bin/zsh")
 '(fill-column 69)
 '(gnus-select-method (quote (nnimap "imap.yandex.ru")))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "lib" "etc" "share" "bin" "include" "lib64" "src" ".mypy_cache")))
 '(ivy-mode t)
 '(keyboard-coding-system (quote utf-8-emacs))
 '(menu-bar-mode nil)
 '(ns-function-modifier (quote hyper))
 '(nyan-mode t)
 '(org-agenda-files (list org-default-notes-file))
 '(org-capture-templates
   (quote
    (("t" "Task" entry
      (file+headline org-default-notes-file "Inbox")
      "** TODO %? [/]
   :CAPTURED: %U
"))))
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 3.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("org" . "https://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (auctex cdlatex move-text elpy zone-nyan nyan-mode xclip restart-emacs exec-path-from-shell disable-mouse ein ws-butler smartparens flycheck company-jedi docker py-isort counsel-projectile counsel dockerfile-mode realgud yaml-mode magit projectile markdown-mode)))
 '(projectile-after-switch-project-hook
   (quote
    ((lambda nil
       (progn
	 (pyvenv-activate
	  (projectile-project-root))
	 (setenv "PYTHONPATH"
		 (projectile-project-root)))))))
 '(projectile-completion-system (quote ivy))
 '(projectile-mode t nil (projectile))
 '(projectile-project-search-path (quote ("~/projects")))
 '(python-check-command "pylint")
 '(python-shell-completion-native-enable nil)
 '(pyvenv-exec-shell "/bin/zsh")
 '(realgud:pdb-command-name "python -m pdb")
 '(save-place-mode t)
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(xclip-mode t)
 '(xclip-select-enable-clipboard nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "nil" :family "Menlo")))))
;; for the first start of the emacs daemon
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)
;; projects
(define-key projectile-mode-map (kbd "H-p") 'projectile-command-map)
;; git
(global-set-key (kbd "H-g") 'magit-status)
;; docker
(global-set-key (kbd "H-d") 'docker)
;; python
(elpy-enable)
;; debugger
(require 'realgud)
;; static code analysis
(add-hook 'python-mode-hook 'jedi:setup)
;; smart parentheses
(smartparens-global-mode)
;; trim trailing whitespaces
(ws-butler-global-mode)
;; swiper
(global-set-key (kbd "H-s") 'swiper)
;; fix PATH for MacOS
(exec-path-from-shell-initialize)
;; setup the screensaver
(require 'zone)
(setq zone-programs [zone-nyan])
(zone-when-idle 300)
;; org-mode customization
(global-set-key (kbd "H-a") 'org-agenda)
(global-set-key (kbd "H-c") 'org-capture)
;; moving regions
(require 'move-text)
(move-text-default-bindings)
