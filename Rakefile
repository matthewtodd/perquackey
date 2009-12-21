begin
  require 'shoe'
rescue LoadError
  abort 'Please `gem install shoe` to get started.'
end

Shoe.tie('perquackey', '0.5.2', 'Provides console session and Camping webapp for looking up Perquackey word matches') do |spec|
  spec.add_runtime_dependency('camping')
end
