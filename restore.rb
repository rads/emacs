File.open('local.el', 'w') do |f|
  f.puts '(load "rads")'
end

`git submodule update --init`
`cd vendor/rinari && git submodule update --init`
puts "Don't forget to M-x byte-compile-file js2"