(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine 'xetex)
 '(auth-source-save-behavior nil)
 '(browse-url-browser-function 'eww-browse-url)
 '(c++-mode-hook '(lsp))
 '(c-basic-offset 2)
 '(c-mode-hook '(lsp))
 '(calendar-date-style 'iso)
 '(calendar-mark-diary-entries-flag t)
 '(calendar-view-diary-initially-flag t)
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(custom-safe-themes
   '("7de64ff2bb2f94d7679a7e9019e23c3bf1a6a04ba54341c36e7cf2d2e56e2bcc"
     default))
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
 '(enable-recursive-minibuffers t)
 '(erc-join-buffer 'window-noselect)
 '(erc-minibuffer-notice t)
 '(erc-modules
   '(autojoin button completion irccontrols list match menu
              move-to-prompt netsplit networks noncommands readonly
              stamp spelling))
 '(erc-server "localhost")
 '(eshell-rc-script "~/.zshenv")
 '(exec-path-from-shell-arguments nil)
 '(exec-path-from-shell-variables
   '("XDG_CONFIG_HOME" "PATH" "MANPATH" "LC_ALL" "LANG"
     "JUPYTER_CONFIG_DIR" "IPYTHONDIR" "ZDOTDIR" "HISTFILE"
     "HISTSIZE" "HISTFILESIZE" "PYENV_ROOT"))
 '(explicit-shell-file-name "/bin/zsh")
 '(fill-column 69)
 '(fireplace-sound-on t)
 '(global-company-mode t)
 '(global-diff-hl-mode t)
 '(global-flycheck-mode t)
 '(global-hungry-delete-mode t)
 '(global-subword-mode t)
 '(global-visual-line-mode t)
 '(global-writeroom-mode t nil (writeroom-mode))
 '(gnus-inhibit-startup-message t)
 '(gnus-select-method '(nnml ""))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(java-mode-hook '(lsp))
 '(keyboard-coding-system 'utf-8-emacs)
 '(lsp-after-initialize-hook '(lsp-enable-which-key-integration) t)
 '(lsp-java-format-comments-enabled nil)
 '(lsp-java-format-settings-profile "GoogleStyle")
 '(lsp-java-format-settings-url
   "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml")
 '(magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)
 '(major-mode-remap-alist '((python-mode . python-ts-mode)))
 '(minibuffer-depth-indicate-mode t)
 '(ns-function-modifier 'hyper)
 '(nyan-animate-nyancat t)
 '(nyan-bar-length 10)
 '(nyan-mode t)
 '(nyan-wavy-trail t)
 '(org-agenda-files (list org-default-notes-file))
 '(org-capture-templates
   '(("t" "Task" entry (file+headline org-default-notes-file "Inbox")
      "** TODO %? [/]\12   :CAPTURED: %U\12")))
 '(org-format-latex-options
   '(:foreground default :background default :scale 3.0 :html-foreground
                 "Black" :html-background "Transparent" :html-scale
                 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-mode-hook
   '(#[0 "\300\301\302\303\304$\207"
         [add-hook change-major-mode-hook org-fold-show-all append
                   local]
         5]
     #[0 "\300\301\302\303\304$\207"
         [add-hook change-major-mode-hook org-babel-show-result-all
                   append local]
         5]
     org-babel-result-hide-spec org-babel-hide-all-hashes
     org-modern-mode))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("org" . "https://orgmode.org/elpa/")))
 '(package-selected-packages
   '(cdlatex company consult dictionary diff-hl disable-mouse docker
             dockerfile-mode doom-modeline doom-themes ein ellama
             elpher exec-path-from-shell fireplace flycheck forge
             helpful hungry-delete lsp-java lsp-metals lsp-ui magit
             marginalia markdown-mode move-text nerd-icons-completion
             nov nyan-mode org-modern protobuf-mode python-coverage
             realgud rustic smartparens terraform-mode vertico
             which-key writeroom-mode ws-butler xclip yaml-mode
             zone-nyan))
 '(proced-auto-update-flag t)
 '(prog-mode-hook '(flyspell-mode))
 '(project-switch-commands 'project-find-file)
 '(python-shell-completion-native-enable nil)
 '(realgud:pdb-command-name "python -m pdb")
 '(ring-bell-function 'ignore)
 '(save-place-mode t)
 '(send-mail-function 'smtpmail-send-it)
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(smartparens-global-mode t)
 '(tramp-default-method "ssh")
 '(transient-default-level 6)
 '(vertico-mode t)
 '(which-key-idle-delay 2.0)
 '(which-key-mode t)
 '(writeroom-major-modes
   '(prog-mode text-mode special-mode term-mode org-agenda-mode))
 '(ws-butler-global-mode t)
 '(xclip-mode t)
 '(xclip-select-enable-clipboard nil)
 '(yas-global-mode t))
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)
(if (eq system-type 'darwin)
    (progn
      (global-set-key (kbd "H-g") 'magit-status)
      (global-set-key (kbd "H-d") 'docker)
      (global-set-key (kbd "H-l") 'dictionary-lookup-definition)
      (global-set-key (kbd "H-a") 'org-agenda)
      (global-set-key (kbd "H-c") 'org-capture))
  (progn
      (global-set-key (kbd "C-c d") 'docker)
      (global-set-key (kbd "C-c l") 'dictionary-lookup-definition)
      (global-set-key (kbd "C-c a") 'org-agenda)
      (global-set-key (kbd "C-c c") 'org-capture)))
(require 'realgud)
(add-hook 'python-ts-mode-hook 'eglot-ensure)
(add-hook
 'before-save-hook
 (lambda nil (if (executable-find "ruff") (eglot-format-buffer))))
(exec-path-from-shell-initialize)
(require 'zone)
(setq zone-programs [zone-nyan])
(zone-when-idle 300)
(require 'move-text)
(move-text-default-bindings)
(appt-activate)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'doom-acario-dark)
(setq egp-pinentry-mode 'loopback)
(require 'python-coverage)
(use-package consult
  :bind (
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ("C-x b" . consult-buffer)           ;; orig. switch-to-buffer
         ("M-y" . consult-yank-pop)           ;; orig. yank-pop
         ("M-g M-g" . consult-goto-line)      ;; orig. goto-line
         ("M-s r" . consult-ripgrep)))
(use-package ellama
  :bind ("C-c e" . ellama-transient-main-menu))
(global-set-key (kbd "C-:") 'avy-goto-char-timer)
(flycheck-add-next-checker 'python-ruff 'python-pyright)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))
(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))
(global-set-key (kbd "C-h f") #'helpful-callable)
(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-h x") #'helpful-command)
(global-set-key (kbd "C-c C-d") #'helpful-at-point)
(global-set-key (kbd "C-h F") #'helpful-function)
