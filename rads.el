(add-to-list 'load-path "~/.emacs.d/vendor")

(load "rads/global")
(load "rads/bindings")
(load "rads/theme")
(load "rads/modes")
(load "rads/defuns")
(load "rads/temp_files")

(server-start)
(shell)