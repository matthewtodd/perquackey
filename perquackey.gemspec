$:.unshift File.expand_path('../lib', __FILE__)
require 'perquackey'

Gem::Specification.new do |spec|
  spec.name    = 'perquackey'
  spec.version = Perquackey::VERSION

  spec.summary = 'Provides console session and simple webapp for looking up Perquackey word matches'
  spec.description = spec.summary
  spec.author = 'Matthew Todd'
  spec.email  = 'matthew.todd@gmail.com'
  spec.homepage = 'http://github.com/matthewtodd/perquackey'

  spec.required_ruby_version = '>= 1.8.7'
  spec.add_runtime_dependency 'sinatra', '~> 1.0'
  spec.add_runtime_dependency 'optparse-defaults', '~> 0.1.0'
  spec.add_development_dependency 'redgreen', '~> 1.2.2'
  spec.add_development_dependency 'ronn', '~> 0.5'
  spec.add_development_dependency 'shoe', '~> 0.6.2'

  spec.files            = Dir['**/*.rdoc', 'bin/*', 'data/**/*', 'ext/**/*.{rb,c}', 'lib/**/*.rb', 'man/**/*', 'test/**/*.rb']
  spec.executables      = Dir['bin/*'].map &File.method(:basename)
  spec.extensions       = Dir['ext/**/extconf.rb']
  spec.extra_rdoc_files = Dir['**/*.rdoc', 'ext/**/*.c']
  spec.test_files       = Dir['test/**/*_test.rb']

  spec.rdoc_options     = %W(
    --main README.rdoc
    --title #{spec.full_name}
    --inline-source
  )
end
