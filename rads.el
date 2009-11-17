(add-to-list 'load-path "~/.emacs.d/vendor")

(load "rads/defuns")
(load "rads/global")
(load "rads/bindings")
(load "rads/theme")
(load "rads/modes")
(load "rads/temp_files")

(vendor 'textmate)
(textmate-mode)
(vendor 'rinari)
(vendor 'rhtml-mode)

(server-start)
(shell)