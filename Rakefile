require 'rubygems'

spec = Gem::Specification.new do |spec|
  spec.name             = 'perquackey'
  spec.version          = '0.3.1'
  spec.summary          = 'Provides irb console session and Camping webapp for looking up Perquackey word matches'
  spec.files            = FileList['README', 'CHANGELOG', 'TODO', 'bin/*', 'lib/**/*.rb', 'resources/*'].to_a
  spec.executables      = ['perquackey']
  spec.has_rdoc         = true
  spec.rdoc_options     = %W[--main README --title #{spec.name}-#{spec.version} --inline-source --line-numbers]
  spec.extra_rdoc_files = FileList['README', 'CHANGELOG', 'TODO'].to_a
  spec.author           = 'Matthew Todd'
  spec.email            = 'matthew.todd@gmail.com'

  spec.add_dependency     'RubyInline'
  spec.add_dependency     'camping'
  spec.add_dependency     'mongrel'
end

desc 'Generate a gemspec file'
task :default do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end
