unless File.exist?('local.el')
  File.open('local.el', 'w') do |f|
    f.puts '(load "rads")'
  end
end

`git submodule update --init`
`cd vendor/rinari && git submodule update --init`
puts "Don't forget to M-x byte-compile-file js2"
puts "~/Applications/Emacs.app/Contents/MacOS/Emacs --batch --eval '(byte-compile-file \"~/.emacs.d/vendor/js2.el\")'"
