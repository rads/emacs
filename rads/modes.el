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

;; auto pair
(require 'autopair)
(autopair-global-mode)