;; Coding hook
(add-hook 'coding-hook 'turn-on-whitespace)
(add-hook 'coding-hook 'local-comment-auto-fill)
(add-hook 'coding-hook 'turn-on-hl-line-mode)
(add-hook 'coding-hook 'turn-on-save-place-mode)
(add-hook 'coding-hook 'add-watchwords)
(add-hook 'coding-hook 'idle-highlight)
(add-hook 'coding-hook 'turn-on-autopair)

;; Yasnippet
(add-to-list 'load-path (concat vendor-dir "yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat vendor-dir "yasnippet/snippets"))
(yas/load-directory (concat dotfiles-dir "snippets"))

;; Markdown
(add-to-list 'auto-mode-alist '("\\.txt$" . markdown-mode))
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; JavaScript
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook '(lambda ()
  (run-coding-hook)
  (setq js-indent-level 2)
  (define-key js-mode-map (kbd "RET") 'newline-and-indent)))

;; Ruby
(add-hook 'ruby-mode-hook '(lambda ()
  (run-coding-hook)
  (set (make-local-variable 'tab-width) 2)
  (setq ruby-use-encoding-map nil)
  (define-key ruby-mode-map (kbd "RET") 'newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; nXhtml
(load (concat vendor-dir "nxhtml/autostart.el"))

(setq mumamo-chunk-coloring 'submode-colored
      nxhtml-skip-welcome t
      indent-region-mode t
      rng-nxml-auto-validate-flag nil)

(eval-after-load 'mumamo
  '(eval-after-load 'zenburn
     '(ignore-errors (custom-set-faces
                      '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
                      '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "grey20"))))))))

;; Rinari (Minor Mode for Ruby On Rails)
(setq rinari-major-modes
      (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
            'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook))

(add-to-list 'auto-mode-alist '("\\.html\\.erb$" . eruby-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . eruby-nxhtml-mumamo-mode))

;; Textmate and Peepopen
(add-to-list 'load-path (concat vendor-dir "textmate.el/"))
(require 'textmate)
(require 'peepopen)
(textmate-mode)

(require 'autopair)