;; others
(load "rads/shell")
(load "rads/clojure")
(load "rads/ruby")

;; whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq show-trailing-whitespace (not buffer-read-only))

;; Save a list of recent files visited.
(recentf-mode 1)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; ido-mode is like magic pixie dust!
(when (> emacs-major-version 21)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-max-prospects 10))

;; yasnippet
(vendor 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")
(yas/load-directory "~/.emacs.d/vendor/yasnippets-rails/rails-snippets")
(setq yas/prompt-functions '(yas/ido-prompt))

;; paredit
(autoload 'paredit-mode "paredit"
     "Minor mode for pseudo-structurally editing Lisp code."
     t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'clojure-mode-hook          (lambda () (paredit-mode +1)))

;; magit
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;; autopair
(vendor 'autopair)
(add-hook 'html-mode-hook
          #'(lambda () (autopair-mode)))

(vendor 'php-mode)
(add-to-list 'auto-mode-alist
     	     '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

(vendor 'google-c-style)
(add-hook 'c-mode-common-hook
          '(lambda ()
             (setq c-auto-newline t)
             (define-key c-mode-map "{" 'defunkt/c-electric-brace)))
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; haskell
(load "~/.emacs.d/vendor/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(vendor 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.txt" . markdown-mode) auto-mode-alist))
(add-hook 'markdown-mode-hook 'visual-line-mode)