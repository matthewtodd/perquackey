require 'pathname'
require 'rbconfig'
require 'rbconfig/datadir'

module Perquackey
  VERSION = '0.7.2'

  autoload :Anagrams,   'perquackey/anagrams'
  autoload :Application,'perquackey/application'
  autoload :Console,    'perquackey/console'
  autoload :Dictionary, 'perquackey/dictionary'
  autoload :Game,       'perquackey/game'
  autoload :Server,     'perquackey/server'
  autoload :WordTable,  'perquackey/word_table'

  def self.datadir
    @@datadir ||= begin
      datadir = RbConfig.datadir('perquackey')
      if !File.exist?(datadir)
        warn "WARN: #{datadir} does not exist.\n  Trying again with relative data directory..."
        datadir = File.expand_path('../../data/perquackey', __FILE__)
      end
      Pathname.new(datadir)
    end
  end
end
