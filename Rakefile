require 'rubygems'
require 'rake/testtask'

spec = Gem::Specification.new do |spec|
  spec.name             = 'perquackey'
  spec.version          = '0.4.0'
  spec.summary          = 'Provides console session and Camping webapp for looking up Perquackey word matches'
  spec.files            = FileList['README', 'CHANGELOG', 'TODO', 'bin/*', 'ext/**/*.c', 'ext/**/*.rb', 'lib/**/*.rb', 'resources/*'].to_a
  spec.executables      = ['perquackey']
  spec.extensions       = FileList['ext/**/extconf.rb']
  spec.has_rdoc         = true
  spec.rdoc_options     = %W[--main README --title #{spec.name}-#{spec.version} --inline-source --line-numbers]
  spec.extra_rdoc_files = FileList['README', 'CHANGELOG', 'TODO'].to_a
  spec.author           = 'Matthew Todd'
  spec.email            = 'matthew.todd@gmail.com'
  spec.add_dependency     'camping'
end

desc 'Remove generated artifacts'
task :clean do
  FileList['*.gem', 'ext/**/Makefile', 'ext/**/*.bundle', 'ext/**/*.o'].each { |file| rm file }
end

desc 'Generate a gemspec file'
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end

desc 'Build C extensions'
task :extensions do
  spec.extensions.each do |extension|
    Dir.chdir(File.dirname(extension)) do
      system 'ruby', 'extconf.rb'
      system 'make'
    end
  end
end

Rake::TestTask.new do |task|
  task.libs = ['ext', 'lib']
  task.pattern = 'test/*_test.rb'
end

task :default => [:extensions, :test]
