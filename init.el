;; Disable mouse interface.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Set up load path.
(setq dotfiles-dir (file-name-directory
                     (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

;; Load system-specific config.
(load (concat dotfiles-dir "local.el"))

;; Set up ELPA.
(require 'package)
(dolist
  (source '(("technomancy" . "http://repo.technomancy.us/emacs/")
            ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

;; Require basic packages.
(require 'cl)         ;; Common Lisp Extension
(require 'saveplace)  ;; Save place between files
(require 'ffap)       ;; More sensible key bindings for finding files
(require 'uniquify)   ;; More sensible buffer names
(require 'ansi-color) ;; ANSI color in shells
(require 'recentf)    ;; Keep track of recently modified files.

;; Load custom functions.
(load (concat dotfiles-dir "defuns.el"))

