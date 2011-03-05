(require 'autopair)

;; Yasnippet
(add-to-list 'load-path (concat dotfiles-dir "elpa-to-submit/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "elpa-to-submit/yasnippet/snippets"))
(yas/load-directory (concat dotfiles-dir "snippets"))

;; Coding hook
(add-hook 'coding-hook 'turn-on-whitespace)
(add-hook 'coding-hook 'local-comment-auto-fill)
(add-hook 'coding-hook 'turn-on-hl-line-mode)
(add-hook 'coding-hook 'turn-on-save-place-mode)
(add-hook 'coding-hook 'add-watchwords)
(add-hook 'coding-hook 'idle-highlight)
(add-hook 'coding-hook 'turn-on-autopair)

;; Markdown
(add-to-list 'auto-mode-alist '("\\.txt$" . markdown-mode))
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Ruby
(eval-after-load 'ruby-mode
  '(progn
     ;; work around possible elpa bug
     (ignore-errors (require 'ruby-compilation))
     (set (make-local-variable 'tab-width) 2)
     (setq ruby-use-encoding-map nil)
     (add-hook 'ruby-mode-hook 'run-coding-hook)
     (define-key ruby-mode-map (kbd "RET") 'newline-and-indent)))

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))