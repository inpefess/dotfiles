;;; init.el --- my Emacs config -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine 'xetex)
 '(auth-source-save-behavior nil)
 '(auth-sources '("~/.authinfo.gpg"))
 '(browse-url-browser-function 'eww-browse-url)
 '(c-basic-offset 2)
 '(calendar-date-style 'iso)
 '(calendar-mark-diary-entries-flag t)
 '(calendar-view-diary-initially-flag t)
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(custom-safe-themes
   '("7de64ff2bb2f94d7679a7e9019e23c3bf1a6a04ba54341c36e7cf2d2e56e2bcc"
     default))
 '(diary-number-of-entries 7)
 '(dictionary-server "localhost")
 '(disable-mouse-global-mode t nil (disable-mouse))
 '(doc-view-resolution 200)
 '(eat-term-name "xterm-direct")
 '(ediff-highlight-all-diffs nil)
 '(ediff-split-window-function 'split-window-vertically)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(eglot-autoshutdown t)
 '(emms-info-functions '(emms-info-native))
 '(emms-player-list '(emms-player-vlc))
 '(enable-recursive-minibuffers t)
 '(erc-join-buffer 'window-noselect)
 '(erc-minibuffer-notice t)
 '(erc-modules
   '(autojoin button completion irccontrols list match menu
              move-to-prompt netsplit networks noncommands readonly
              stamp spelling))
 '(erc-server "localhost")
 '(exwm-input-global-keys
   '(([8388646] lambda (cmd)
      (interactive (list (read-shell-command "$ ")))
      (start-process-shell-command cmd nil cmd))))
 '(exwm-randr-mode (display-graphic-p))
 '(exwm-randr-workspace-monitor-plist '(0 "DP-2"))
 '(exwm-wm-mode (display-graphic-p))
 '(fill-column 69)
 '(fireplace-sound-on t)
 '(global-company-mode t)
 '(global-diff-hl-mode t)
 '(global-hungry-delete-mode t)
 '(global-subword-mode t)
 '(global-visual-line-mode t)
 '(global-writeroom-mode t nil (writeroom-mode))
 '(gnus-inhibit-startup-message t)
 '(gnus-select-method '(nnml ""))
 '(icomplete-vertical-mode t)
 '(indent-bars-treesit-support t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(keyboard-coding-system 'utf-8-emacs)
 '(magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)
 '(major-mode-remap-alist '((python-mode . python-ts-mode)))
 '(marginalia-mode t)
 '(minibuffer-depth-indicate-mode t)
 '(nerd-icons-completion-mode t)
 '(nerd-icons-font-family "Inconsolate LGC Nerd Font")
 '(org-agenda-files (list org-default-notes-file))
 '(org-babel-load-languages '((emacs-lisp . t) (python . t)))
 '(org-capture-templates
   '(("t" "Task" entry (file+headline org-default-notes-file "Inbox")
      "** TODO %? [/]\12   :CAPTURED: %U\12")))
 '(org-confirm-babel-evaluate nil)
 '(org-format-latex-options
   '(:foreground default :background default :scale 3.0 :html-foreground
                 "Black" :html-background "Transparent" :html-scale
                 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-id-link-to-org-use-id t)
 '(org-journal-dir "~/projects/my-journal")
 '(org-super-agenda-mode t)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(avy company dape diff-hl disable-mouse disk-usage docker
         dockerfile-mode doom-themes eat elpher emms exwm
         flymake-pyrefly flymake-ruff forge format-all helpful
         hungry-delete indent-bars magit marginalia markdown-mode
         move-text nerd-icons-completion nerd-icons-dired nov
         org-journal org-modern org-super-agenda ox-pandoc ox-rst
         protobuf-mode smartparens terraform-mode writeroom-mode
         ws-butler xclip yaml-mode zone-nyan))
 '(proced-auto-update-flag t)
 '(project-switch-commands 'project-find-file)
 '(python-shell-completion-native-enable nil)
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(repeat-mode t)
 '(ring-bell-function 'ignore)
 '(save-place-mode t)
 '(send-mail-function 'smtpmail-send-it)
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(smartparens-global-mode t)
 '(tramp-default-method "ssh")
 '(transient-default-level 6)
 '(which-key-idle-delay 2.0)
 '(which-key-mode t)
 '(writeroom-global-effects
   '(writeroom-set-fullscreen writeroom-set-alpha
                              writeroom-set-menu-bar-lines
                              writeroom-set-tool-bar-lines
                              writeroom-set-vertical-scroll-bars))
 '(writeroom-major-modes
   '(Custom-mode prog-mode text-mode eat-mode org-agenda-mode
                 special-mode conf-mode))
 '(ws-butler-global-mode t)
 '(xclip-mode (display-graphic-p))
 '(xclip-select-enable-clipboard nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)
(use-package docker
  :bind ("C-c d" . docker))
(use-package dictionary
  :bind ("C-c l" . dictionary-lookup-definition))
(use-package org-agenda
  :bind ("C-c a" . org-agenda))
(use-package org-capture
  :bind ("C-c c" . org-capture))
(use-package eglot
  :hook(python-base-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
               '((python-ts-mode) . ("ty" "server"))))
(use-package zone
  :init (setq zone-programs [zone-nyan])
  :config (zone-when-idle 300))
(use-package move-text
  :config (move-text-default-bindings))
(use-package appt
  :config (appt-activate))
(use-package doom-themes
  :config (load-theme 'doom-acario-dark))
(use-package ellama
  :bind ("C-c e" . ellama-transient-main-menu))
(use-package avy
  :bind ("C-:" . avy-goto-char-timer))
(use-package nov
  :config (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))
(use-package helpful
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)
         ("C-h x" . helpful-command)
         ("C-c C-d" . helpful-at-point)
         ("C-h F" . helpful-function)))
(use-package org-journal)
(use-package ox-pandoc)
(use-package ox-rst)
(use-package org
  :init
  (setq org-babel-default-header-args:python
        `((:session . "*Python*")
          (:exports . "both")
          (:results . "output")
          (:tangle . "yes")
          (:padline . "no")
          (:comments . "org"))))
(use-package format-all
  :commands format-all-mode
  :hook (prog-mode . format-all-mode)
  :config
  (setq-default format-all-formatters
                '(("Python" (ruff "format")))))
(use-package marginalia
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle)))
(use-package nerd-icons-completion
  :after marginalia
  :config (nerd-icons-completion-mode))
(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))
(use-package indent-bars
  :hook (python-base-mode . indent-bars-mode))
(use-package flymake-ruff
  :hook (eglot-managed-mode . flymake-ruff-load))
(use-package flymake
  :hook
  ((prog-mode . flymake-mode)
   (prog-mode . flyspell-mode))
  :bind
  (("M-n" . flymake-goto-next-error)
   ("M-p" . flymake-goto-prev-error)))
(use-package activate-venv
  :load-path "elisp"
  :config
  (advice-add 'project-switch-project :before #'activate-venv))
(use-package flymake-pyrefly
  :hook (eglot-managed-mode . pyrefly-setup-flymake-backend))
(use-package org-modern
  :hook (org-mode . org-modern-mode))
(use-package org-mode
  :bind (("C-c M-s" . org-store-link)))
(use-package exwm
  :hook (exwm-update-class . (lambda () (exwm-workspace-rename-buffer exwm-class-name))))
(emms-all)
(provide 'init)
;;; init.el ends here
