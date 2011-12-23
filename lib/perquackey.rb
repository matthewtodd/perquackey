require 'perquackey/version'

require 'pathname'
require 'rubygems'

module Perquackey
  autoload :Anagrams,   'perquackey/anagrams'
  autoload :Application,'perquackey/application'
  autoload :Console,    'perquackey/console'
  autoload :Dictionary, 'perquackey/dictionary'
  autoload :Game,       'perquackey/game'
  autoload :Server,     'perquackey/server'
  autoload :Table,      'perquackey/table'

  def self.datadir
    Pathname.new Gem.datadir('perquackey')
  end
end
