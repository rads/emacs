(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'comint-mode-hook
          (lambda ()
            (define-key comint-mode-map [up] 'comint-previous-input)
            (define-key comint-mode-map [down] 'comint-next-input)
            (define-key comint-mode-map "\C-p" 'comint-previous-input)
            (define-key comint-mode-map "\C-n" 'comint-next-input)))
