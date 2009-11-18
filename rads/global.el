;; indentation
(setq-default tab-width 4)
(setq-default c-indent-level 2)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(prefer-coding-system 'utf-8)

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
(setq default-frame-alist '((font . "-unknown-Consolas-normal-normal-normal-*-15-*-*-*-m-0-*-*")))

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
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      delete-by-moving-to-trash t
      shift-select-mode nil
      truncate-partial-width-windows nil
      delete-by-moving-to-trash nil
      uniquify-buffer-name-style 'forward
      whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-line-column 100
      xterm-mouse-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)