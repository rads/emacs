(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; indentation
(setq-default tab-width 2)
(setq-default c-indent-level 2)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(prefer-coding-system 'utf-8)
(setq vc-handled-backends nil)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

;; disable window elements
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; font
;(setq default-frame-alist '((font . "-unknown-Consolas-normal-normal-normal-*-15-*-*-*-m-0-*-*")))

;; common packages
(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; Platform-specific stuff
(when (eq system-type 'darwin)
  ;; Work around a bug on OS X where system-name is FQDN
  (setq system-name (car (split-string system-name "\\.")))
  ;; Work around a bug where environment variables aren't set correctly
  (require 'osx-plist)
  (when (file-exists-p "~/.MacOSX/environment.plist")
    (osx-plist-update-environment)))

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)

(setq visible-bell t
      fringe-mode (cons 4 0)
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      ffap-machine-p-known 'reject
      whitespace-style '(trailing lines space-before-tab
                                  face indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      oddmuse-directory (concat dotfiles-dir "oddmuse")
      xterm-mouse-mode t
      save-place-file (concat dotfiles-dir "places"))

(defalias 'yes-or-no-p 'y-or-n-p)

(defvar coding-hook nil
  "Hook that gets run on activation of any programming mode.")
