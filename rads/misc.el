;; Make the titles better and remove any UI.
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))
(add-hook 'before-make-frame-hook 'turn-off-tool-bar)

;; Use UTF-8.
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Enable ANSI color in terminals.
(ansi-color-for-comint-mode-on)

(setq
  visible-bell t                      ;; Show the box in the middle of the
                                      ;; screen on error.
  echo-keystrokes 0.1                 ;; Show keystrokes in the minibuffer.
  font-lock-maximum-decoration t
  inhibit-startup-message t
  transient-mark-mode t               ;; Highlight the current region.
  color-theme-is-global t
  delete-by-moving-to-trash t
  shift-select-mode nil               ;; Don't select when holding down shift.
  mouse-yank-at-point t               ;; Insert yanked text at the cursor, not
                                      ;; at the mouse pointer.
  require-final-newline t             ;; Add a newline at the end of every
                                      ;; file.
  truncate-partial-width-windows nil  ;; Continue long lines instead of
                                      ;; truncating them.
  uniquify-buffer-name-style 'forward ;; Use names like tmp/Makefile and
                                      ;; zaphod/Makefile instead of names like
                                      ;; Makefile and Makefile<2>.

  flyspell-issue-message-flag nil     ;; Flyspell is slow if this is not nil.

  ;; Show when spaces and tabs are next to each other.
  whitespace-style '(trailing lines space-before-tab
                     face indentation space-after-tab)

  whitespace-line-column 80           ;; Highlight lines longer than 80 cols.

  xterm-mouse-mode t                  ;; Allow mouse clicks in the terminal.
  save-place-file (concat dotfiles-dir "places"))

;; Color theme
(require 'color-theme)
(require 'zenburn)
(color-theme-zenburn)

(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra"))

;; Show column numbers
(column-number-mode t)

;; Only show the left fringe.
(set-fringe-mode (cons 4 0))

;; Save a list of recent files.
(recentf-mode t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)

;; ido mode
(ido-mode t)
(setq
  ido-enable-flex-matching t         ;; Use fuzzy name matching.
  ido-create-new-buffer 'always      ;; Always make a new buffer if nothing
                                     ;; matches.
  ido-max-prospects 10)              ;; Limit to 10 choices.

(set-default 'indent-tabs-mode nil)  ;; Use spaces, not tabs.
(set-default 'indicate-empty-lines t)  ;; Show empty trailing lines.

(defalias 'yes-or-no-p 'y-or-n-p)

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                         (concat dotfiles-dir "backups")))))

;; Platform-specific stuff
(when (eq system-type 'darwin)
  ;; Work around a bug on OS X where system-name is FQDN
  (setq system-name (car (split-string system-name "\\."))))

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)
