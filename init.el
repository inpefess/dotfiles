(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine 'xetex)
 '(before-save-hook
   '((lambda nil
       (if
	   (executable-find "isort")
	   (py-isort-before-save)))
     (lambda nil
       (if
	   (executable-find "black")
	   (elpy-black-fix-code)))))
 '(browse-url-browser-function 'eww-browse-url)
 '(c++-mode-hook '(lsp))
 '(c-mode-hook '(lsp))
 '(calendar-date-style 'iso)
 '(calendar-mark-diary-entries-flag t)
 '(calendar-view-diary-initially-flag t)
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(company-auto-commit t)
 '(company-auto-complete t)
 '(company-backends
   '(company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
		  (company-dabbrev-code company-gtags company-etags company-keywords)
		  company-oddmuse company-dabbrev company-jedi))
 '(counsel-mode t)
 '(default-frame-alist '((fullscreen . maximized)))
 '(diary-number-of-entries 7)
 '(dictionary-server "localhost")
 '(disable-mouse-global-mode t nil (disable-mouse))
 '(doom-modeline-height 10)
 '(doom-modeline-mode t)
 '(ediff-highlight-all-diffs nil)
 '(ediff-split-window-function 'split-window-vertically)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(ein:completion-backend 'ein:use-company-backend)
 '(ein:notebook-modes '(ein:notebook-python-mode))
 '(electric-operator-enable-in-docs t)
 '(elpy-mode-hook '(flycheck-mode diff-hl-margin-mode))
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-sane-defaults))
 '(elpy-rpc-virtualenv-path 'current)
 '(elpy-test-pytest-runner-command '("py.test"))
 '(elpy-test-runner 'elpy-test-pytest-runner)
 '(enable-recursive-minibuffers t)
 '(erc-join-buffer 'window-noselect)
 '(erc-minibuffer-notice t)
 '(erc-modules
   '(autojoin button completion irccontrols list match menu move-to-prompt netsplit networks noncommands readonly stamp spelling))
 '(erc-server "localhost")
 '(eshell-rc-script "~/.zshenv")
 '(exec-path-from-shell-arguments nil)
 '(exec-path-from-shell-variables
   '("XDG_CONFIG_HOME" "PATH" "MANPATH" "LC_ALL" "LANG" "PYLINTHOME" "JUPYTER_CONFIG_DIR" "IPYTHONDIR" "ZDOTDIR" "HISTFILE" "HISTSIZE" "HISTFILESIZE" "PYENV_ROOT"))
 '(explicit-shell-file-name "/bin/zsh")
 '(fill-column 69)
 '(fireplace-sound-on t)
 '(global-diff-hl-mode t)
 '(global-hungry-delete-mode t)
 '(global-subword-mode t)
 '(global-visual-line-mode t)
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".mypy_cache" "venv*" "build" "_build" ".coverage" ".pytest_cache" "test-results" "dist"))
 '(ivy-mode t)
 '(java-mode-hook '(lsp))
 '(keyboard-coding-system 'utf-8-emacs)
 '(lsp-after-initialize-hook '(lsp-enable-which-key-integration))
 '(menu-bar-mode nil)
 '(minibuffer-depth-indicate-mode t)
 '(ns-function-modifier 'hyper)
 '(nyan-animate-nyancat t)
 '(nyan-bar-length 10)
 '(nyan-mode t)
 '(nyan-wavy-trail t)
 '(org-agenda-files (list org-default-notes-file))
 '(org-capture-templates
   '(("t" "Task" entry
      (file+headline org-default-notes-file "Inbox")
      "** TODO %? [/]
   :CAPTURED: %U
")))
 '(org-format-latex-options
   '(:foreground default :background default :scale 3.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(org-trello-files '("~/.trello.org") nil (org-trello))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("org" . "https://orgmode.org/elpa/")))
 '(package-selected-packages
   '(doom-modeline elpher org-trello lsp-java sbt-mode scala-mode lsp-ui lsp-ivy lsp-metals avy which-key electric-operator fireplace diff-hl hungry-delete dictionary f cdlatex move-text elpy zone-nyan nyan-mode xclip restart-emacs exec-path-from-shell disable-mouse ein ws-butler smartparens flycheck company-jedi docker py-isort counsel-projectile counsel dockerfile-mode realgud yaml-mode magit projectile markdown-mode))
 '(projectile-after-switch-project-hook
   '((lambda nil
       (progn
	 (setq venv-folder
	       (f-join
		(projectile-project-root)
		"venv"))
	 (if
	     (file-directory-p venv-folder)
	     (progn
	       (pyvenv-activate venv-folder)
	       (setenv "PYTHONPATH"
		       (projectile-project-root))
	       (setq python-shell-interpreter
		     (f-join venv-folder "bin" "python"))))))))
 '(projectile-before-switch-project-hook
   '((lambda nil
       (progn
	 (pyvenv-deactivate)
	 (setenv "PYTHONPATH" nil)
	 (setq python-shell-interpreter "python")))))
 '(projectile-completion-system 'ivy)
 '(projectile-mode t nil (projectile))
 '(projectile-project-search-path '("~/projects"))
 '(python-check-command "pylint")
 '(python-shell-completion-native-enable nil)
 '(pyvenv-exec-shell
   "(if (eq system-type 'darwin) \"/bin/zsh\" \"/usr/bin/zsh\")")
 '(realgud:pdb-command-name "python -m pdb")
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(send-mail-function 'mailclient-send-it)
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(xclip-mode t)
 '(xclip-select-enable-clipboard nil)
 '(yas-global-mode t))
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
(require 'dap-java)
(load-file (f-join user-emacs-directory "other-init.el"))
(appt-activate)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "WhiteSmoke" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 174 :width normal :foundry "nil" :family "Menlo")))))
(if (window-system) (load-theme 'manoj-dark))
