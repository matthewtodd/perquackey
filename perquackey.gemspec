# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{perquackey}
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Todd"]
  s.date = %q{2009-05-27}
  s.default_executable = %q{perquackey}
  s.email = %q{matthew.todd@gmail.com}
  s.executables = ["perquackey"]
  s.extensions = ["ext/perquackey/extconf.rb"]
  s.extra_rdoc_files = ["README", "CHANGELOG", "TODO"]
  s.files = ["README", "CHANGELOG", "TODO", "bin/perquackey", "ext/perquackey/dictionary.c", "ext/perquackey/extconf.rb", "lib/perquackey/console.rb", "lib/perquackey/server.rb", "lib/perquackey.rb", "resources/yawl-0.3.2-word.list"]
  s.rdoc_options = ["--main", "README", "--title", "perquackey-0.5.1", "--inline-source", "--line-numbers"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Provides console session and Camping webapp for looking up Perquackey word matches}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<camping>, [">= 0"])
    else
      s.add_dependency(%q<camping>, [">= 0"])
    end
  else
    s.add_dependency(%q<camping>, [">= 0"])
  end
end
