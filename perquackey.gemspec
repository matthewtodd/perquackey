# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{perquackey}
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Todd"]
  s.date = %q{2010-03-30}
  s.default_executable = %q{perquackey}
  s.email = %q{matthew.todd@gmail.com}
  s.executables = ["perquackey"]
  s.extensions = ["ext/perquackey/extconf.rb"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.rdoc", "TODO.rdoc"]
  s.files = ["Rakefile", "lib/perquackey", "lib/perquackey/console.rb", "lib/perquackey/dictionary.bundle", "lib/perquackey/resources", "lib/perquackey/resources/TWL06.txt", "lib/perquackey/server", "lib/perquackey/server/index.erb", "lib/perquackey/server/layout.erb", "lib/perquackey/server.rb", "lib/perquackey/version.rb", "lib/perquackey.rb", "bin/perquackey", "CHANGELOG.rdoc", "README.rdoc", "TODO.rdoc", "perquackey.gemspec", "test/dictionary_test.rb", "test/test_helper.rb", "test/word_table_test.rb", "ext/perquackey/extconf.rb", "ext/perquackey/dictionary.c"]
  s.rdoc_options = ["--main", "README.rdoc", "--title", "perquackey-0.7.0", "--inline-source"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Provides console session and simple webapp for looking up Perquackey word matches}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0"])
    else
      s.add_dependency(%q<sinatra>, [">= 0"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0"])
  end
end
