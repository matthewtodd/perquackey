require 'pathname'
require 'rbconfig'
require 'rbconfig/datadir'

module Perquackey
  VERSION = '0.7.1'

  autoload :Anagrams,   'perquackey/anagrams'
  autoload :Application,'perquackey/application'
  autoload :Console,    'perquackey/console'
  autoload :Dictionary, 'perquackey/dictionary'
  autoload :Game,       'perquackey/game'
  autoload :Server,     'perquackey/server'
  autoload :WordTable,  'perquackey/word_table'

  def self.datadir
    Pathname.new RbConfig.datadir('perquackey')
  end
end
