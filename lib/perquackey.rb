require 'perquackey/version'

require 'pathname'
require 'rbconfig'
require 'rbconfig/datadir'

module Perquackey
  autoload :Anagrams,   'perquackey/anagrams'
  autoload :Application,'perquackey/application'
  autoload :Console,    'perquackey/console'
  autoload :Dictionary, 'perquackey/dictionary'
  autoload :Game,       'perquackey/game'
  autoload :Server,     'perquackey/server'
  autoload :Table,      'perquackey/table'

  def self.datadir
    Pathname.new RbConfig.datadir('perquackey')
  end
end
