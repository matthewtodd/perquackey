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

  spec.add_runtime_dependency 'sinatra'
  spec.add_development_dependency 'redgreen'
  spec.add_development_dependency 'shoe'

  def spec.git_files(glob=nil)
    `git ls-files -z --cached --other --exclude-standard #{glob}`.split("\0")
  end

  spec.files       = spec.git_files
  spec.executables = spec.git_files('bin/*').map &File.method(:basename)
  spec.extensions  = spec.git_files('ext/**/extconf.rb')
  spec.test_files  = spec.git_files('test/{,**/}*_test.rb')

  spec.extra_rdoc_files = spec.git_files('{,**/}*.rdoc')
  spec.rdoc_options     = %W(
    --main README.rdoc
    --title #{spec.full_name}
    --inline-source
  )
end
