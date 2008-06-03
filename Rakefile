require 'rubygems'
require 'rake/gemreleasetask'

$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'perquackey'

spec = Gem::Specification.new do |spec| 
  spec.name             = 'perquackey'
  spec.version          = Perquackey::VERSION
  spec.summary          = ''
  spec.files            = FileList['README', 'CHANGELOG', 'TODO', 'bin/*', 'lib/**/*.rb', 'resources/*'].to_a
  spec.executables      = ['perquackey']
  spec.has_rdoc         = true
  spec.extra_rdoc_files = FileList['README', 'CHANGELOG', 'TODO'].to_a
  spec.author           = 'Matthew Todd'
  spec.email            = 'matthew.todd@gmail.com'
  spec.homepage         = 'http://docs.matthewtodd.org/perquackey'
  
  spec.add_dependency     'RubyInline'
  spec.add_dependency     'camping'
  spec.add_dependency     'mongrel'
end

Rake::GemReleaseTask.new(spec) do |task|
  task.remote_gem_host  = 'woodward'
  task.remote_gem_dir   = '/users/home/matthew/domains/gems.matthewtodd.org/web/public'
  task.remote_docs_host = 'woodward'
  task.remote_docs_dir  = '/users/home/matthew/domains/docs.matthewtodd.org/web/public/perquackey'
end
