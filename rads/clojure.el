(vendor 'slime)
(add-to-list 'load-path "~/.emacs.d/vendor/swank-clojure/src/emacs")
(setq swank-clojure-jar-path "~/clojure/clojure.jar")
(setq swank-clojure-extra-classpaths (list
                                      "~/clojure/clojure-contrib.jar"
                                      "~/clojure/mysql-connector-java-5.1.10-bin.jar"))
(require 'swank-clojure-autoload)
(add-to-list 'load-path "~/.emacs.d/vendor/clojure-mode")
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))