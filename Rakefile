require 'perquackey'
require 'shoe'

Shoe.tie('perquackey', Perquackey::VERSION, 'Provides console session and simple webapp for looking up Perquackey word matches') do |spec|
  spec.add_runtime_dependency('sinatra')
end

desc 'Run perquackey'
task :exec, :options, :needs => :compile do |_, arguments|
  ruby "-rubygems -Iext -Ilib bin/perquackey #{arguments[:options]}"
end
