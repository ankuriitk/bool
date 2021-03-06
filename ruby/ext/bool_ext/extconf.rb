require 'mkmf'

if CONFIG['CC'] =~ /mingw/
  $CFLAGS << ' -O2' 
elsif CONFIG['CC'] =~ /gcc|clang/
  CONFIG['CC'] = ENV['CC'] if ENV['CC']
  $CFLAGS << ' -O2 -Wall -Wunused-parameter' 
end

puts "======= compiling with #{CONFIG['CC']}"

extension_name = 'bool_ext'
find_header('ast.h', '../../../c/')
dir_config(extension_name, ldefault='../../c')

create_makefile(extension_name)
