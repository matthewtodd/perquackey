require 'shoe'

Shoe::Tasks.define('perquackey.gemspec')

desc 'Run perquackey'
task :exec, :options, :needs => :compile do |_, arguments|
  ruby "-rubygems -Iext -Ilib bin/perquackey #{arguments[:options]}"
end
