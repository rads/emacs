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

;; Shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; go
;(add-to-list 'load-path "~/go/misc/emacs" t)
;(require 'go-mode-load)

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")