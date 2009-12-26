begin
  require 'shoe'
rescue LoadError
  abort 'Please `gem install shoe` to get started.'
end

Shoe.tie('perquackey', '0.6.0', 'Provides console session and simple webapp for looking up Perquackey word matches') do |spec|
  spec.add_runtime_dependency('sinatra')
  spec.add_development_dependency('redgreen')
end

desc 'Run perquackey'
task :exec, :options, :needs => :compile do |_, arguments|
  ruby "-rubygems -Iext -Ilib bin/perquackey #{arguments[:options]}"
end
