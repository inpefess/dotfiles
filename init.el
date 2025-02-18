(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine 'xetex)
 '(auth-source-save-behavior nil)
 '(before-save-hook
   '((lambda nil
       (if
           (executable-find "black")
           (elpy-black-fix-code)))))
 '(browse-url-browser-function 'eww-browse-url)
 '(c++-mode-hook '(lsp))
 '(c-basic-offset 2)
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
 '(company-insertion-on-trigger t)
 '(counsel-describe-function-function 'helpful-callable)
 '(counsel-describe-variable-function 'helpful-variable)
 '(counsel-mode t)
 '(counsel-projectile-mode t nil (counsel-projectile))
 '(custom-safe-themes
   '("dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" default))
 '(default-frame-alist '((fullscreen . maximized)))
 '(diary-number-of-entries 7)
 '(dictionary-server "localhost")
 '(disable-mouse-global-mode t nil (disable-mouse))
 '(doc-view-resolution 200)
 '(doom-modeline-height 10)
 '(doom-modeline-mode t)
 '(ediff-highlight-all-diffs nil)
 '(ediff-split-window-function 'split-window-vertically)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(ein:completion-backend 'ein:use-company-backend)
 '(ein:notebook-modes '(ein:notebook-python-mode))
 '(elpy-mode-hook '(flycheck-mode diff-hl-margin-mode isortify-mode))
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
 '(flycheck-languagetool-language "en-GB")
 '(flycheck-languagetool-server-jar
   (f-join
    (getenv "OPTDIR")
    "LanguageTool-6.2/languagetool-server.jar"))
 '(global-diff-hl-mode t)
 '(global-hungry-delete-mode t)
 '(global-subword-mode t)
 '(global-visual-line-mode t)
 '(gnus-inhibit-startup-message t)
 '(gnus-select-method '(nnml ""))
 '(ignored-local-variable-values '((projectile-project-run-cmd . "./local-build.sh")))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ivy-initial-inputs-alist nil)
 '(ivy-mode t)
 '(ivy-rich-mode t)
 '(java-mode-hook '(lsp))
 '(keyboard-coding-system 'utf-8-emacs)
 '(lsp-after-initialize-hook '(lsp-enable-which-key-integration) t)
 '(lsp-java-format-comments-enabled nil)
 '(lsp-java-format-settings-profile "GoogleStyle")
 '(lsp-java-format-settings-url
   "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml")
 '(magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)
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
      "** TODO %? [/]\12   :CAPTURED: %U\12")))
 '(org-format-latex-options
   '(:foreground default :background default :scale 3.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-mode-hook
   '(#[0 "\300\301\302\303\304$\207"
         [add-hook change-major-mode-hook org-fold-show-all append local]
         5]
     #[0 "\300\301\302\303\304$\207"
         [add-hook change-major-mode-hook org-babel-show-result-all append local]
         5]
     org-babel-result-hide-spec org-babel-hide-all-hashes org-modern-mode))
 '(org-trello-current-prefix-keybinding "C-c o")
 '(org-trello-files '("~/.trello.org"))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("org" . "https://orgmode.org/elpa/")))
 '(package-selected-packages
   '(vertico consult-flycheck consult forge python-coverage terraform-mode rustic flycheck-languagetool lsp-java lsp-metals isortify org-modern protobuf-mode elpy helpful ivy-rich doom-themes doom-modeline elpher lsp-ui lsp-ivy which-key fireplace diff-hl hungry-delete dictionary cdlatex move-text zone-nyan nyan-mode xclip exec-path-from-shell disable-mouse ein ws-butler smartparens flycheck company-jedi docker counsel-projectile counsel dockerfile-mode realgud yaml-mode magit projectile markdown-mode))
 '(proced-auto-update-flag t)
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
 '(projectile-use-git-grep t)
 '(python-check-command "pylint")
 '(python-shell-completion-native-enable nil)
 '(pyvenv-exec-shell
   "(if (eq system-type 'darwin) \"/bin/zsh\" \"/usr/bin/zsh\")")
 '(realgud:pdb-command-name "python -m pdb")
 '(ring-bell-function 'ignore)
 '(safe-local-variable-values '((projectile-project-run-cmd . "./local-build.sh")))
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(send-mail-function 'smtpmail-send-it)
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(smartparens-global-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(tramp-default-method "ssh")
 '(transient-default-level 6)
 '(vertico-mode t)
 '(which-key-idle-delay 2.0)
 '(which-key-mode t)
 '(ws-butler-global-mode t)
 '(xclip-mode t)
 '(xclip-select-enable-clipboard nil)
 '(yas-global-mode t))
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)
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
      (global-set-key (kbd "C-c d") 'docker)
      (global-set-key (kbd "C-s") 'swiper)
      (global-set-key (kbd "C-c l") 'dictionary-lookup-definition)
      (global-set-key (kbd "C-c a") 'org-agenda)
      (global-set-key (kbd "C-c c") 'org-capture)))
(elpy-enable)
(require 'realgud)
(add-hook 'python-mode-hook 'jedi:setup)
(exec-path-from-shell-initialize)
(require 'zone)
(setq zone-programs [zone-nyan])
(zone-when-idle 300)
(require 'move-text)
(move-text-default-bindings)
(appt-activate)
(flycheck-languagetool-setup)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'doom-acario-dark)
(setq egp-pinentry-mode 'loopback)
(require 'python-coverage)
(flycheck-add-next-checker 'python-mypy 'python-coverage)
(use-package consult
  :bind (
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ("C-x b" . consult-buffer)           ;; orig. switch-to-buffer
         ("M-y" . consult-yank-pop)           ;; orig. yank-pop
         ("M-g f" . consult-flycheck)
         ("M-g M-g" . consult-goto-line)))    ;; orig. goto-line
(projectile-reset-known-projects)
