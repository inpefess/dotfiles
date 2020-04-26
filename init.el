(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine (quote xetex))
 '(before-save-hook (quote (py-isort-before-save)))
 '(calendar-latitude 55.75222)
 '(calendar-longitude 37.61556)
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(company-auto-complete t)
 '(company-backends
   (quote
    (company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
		  (company-dabbrev-code company-gtags company-etags company-keywords)
		  company-oddmuse company-dabbrev company-jedi)))
 '(counsel-mode t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(default-frame-alist (quote ((fullscreen . maximized))))
 '(disable-mouse-global-mode t nil (disable-mouse))
 '(ediff-highlight-all-diffs nil)
 '(ediff-split-window-function (quote split-window-vertically))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(ein:completion-backend (quote ein:use-company-backend))
 '(ein:notebook-modes (quote (ein:notebook-python-mode)))
 '(electric-operator-enable-in-docs t)
 '(elpy-mode-hook (quote (flycheck-mode diff-hl-margin-mode)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-sane-defaults)))
 '(elpy-rpc-virtualenv-path (quote current))
 '(elpy-test-pytest-runner-command (quote ("py.test")))
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(enable-recursive-minibuffers t)
 '(eshell-rc-script "~/.zshenv")
 '(exec-path-from-shell-variables (quote ("PATH" "MANPATH" "LC_ALL" "LANG")))
 '(explicit-shell-file-name "/bin/zsh")
 '(fill-column 69)
 '(global-diff-hl-mode t)
 '(global-hungry-delete-mode t)
 '(global-subword-mode t)
 '(gnus-select-method (quote (nnimap "imap.yandex.ru")))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".mypy_cache" "venv" "build" "_build" ".coverage" ".pytest_cache" "test-results" "dist")))
 '(ivy-mode t)
 '(keyboard-coding-system (quote utf-8-emacs))
 '(magit-log-mode-hook (quote (hl-line-mode)))
 '(magit-status-sections-hook
   (quote
    (magit-insert-status-headers magit-insert-merge-log magit-insert-rebase-sequence magit-insert-am-sequence magit-insert-sequencer-sequence magit-insert-bisect-output magit-insert-bisect-rest magit-insert-bisect-log magit-insert-untracked-files magit-insert-unstaged-changes magit-insert-staged-changes magit-insert-stashes magit-insert-unpushed-to-pushremote magit-insert-unpushed-to-upstream-or-recent magit-insert-unpulled-from-pushremote magit-insert-unpulled-from-upstream hl-line-mode)))
 '(menu-bar-mode nil)
 '(minibuffer-depth-indicate-mode t)
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
    (which-key electric-operator fireplace diff-hl hungry-delete dictionary f auctex cdlatex move-text elpy zone-nyan nyan-mode xclip restart-emacs exec-path-from-shell disable-mouse ein ws-butler smartparens flycheck company-jedi docker py-isort counsel-projectile counsel dockerfile-mode realgud yaml-mode magit projectile markdown-mode)))
 '(projectile-after-switch-project-hook
   (quote
    ((lambda nil
       (progn
	 (pyvenv-activate
	  (f-join
	   (projectile-project-root)
	   "venv"))
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
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(xclip-mode t)
 '(xclip-select-enable-clipboard nil))
;; for the first start of the emacs daemon
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)
;; using Hyper key only on Mac keyboard
(if (eq system-type 'darwin)
    (progn
      (define-key projectile-mode-map (kbd "H-p") 'projectile-command-map)
      (global-set-key (kbd "H-g") 'magit-status)
      (global-set-key (kbd "H-d") 'docker)
      (global-set-key (kbd "H-s") 'swiper)
      (global-set-key (kbd "H-l") 'dictionary-lookup-definition)
      (global-set-key (kbd "H-a") 'org-agenda)
      (global-set-key (kbd "H-c") 'org-capture))
  (progn
      (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
      (global-set-key (kbd "C-x g") 'magit-status)
      (global-set-key (kbd "C-c d") 'docker)
      (global-set-key (kbd "C-s") 'swiper)
      (global-set-key (kbd "C-c l") 'dictionary-lookup-definition)
      (global-set-key (kbd "C-c a") 'org-agenda)
      (global-set-key (kbd "C-c c") 'org-capture)))
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
;; fix PATH for MacOS
(exec-path-from-shell-initialize)
;; setup the screensaver
(require 'zone)
(setq zone-programs [zone-nyan])
(zone-when-idle 300)
;; moving regions
(require 'move-text)
(move-text-default-bindings)
;; available keybindings
(require 'which-key)
(which-key-mode)
;; electric operator
(require 'electric-operator)
(add-hook 'python-mode-hook #'electric-operator-mode)
(require 'f)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "WhiteSmoke" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 174 :width normal :foundry "nil" :family "Menlo")))))
