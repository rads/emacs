(define-key global-map (kbd "RET") 'newline-and-indent)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key [C-tab] 'other-window)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

(defalias 'qrr 'query-replace-regexp)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-x g") 'magit-status)

;; shell
(global-set-key (kbd "C-x C-z") 'shell)

; no printing!
(when (boundp 'osx-key-mode-map)
 (define-key osx-key-mode-map (kbd "A-p")
   '(lambda () (interactive) (message "noop"))))

; no mailing!
(global-unset-key (kbd "C-x m"))
(global-unset-key "\C-z")