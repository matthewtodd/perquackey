module Perquackey
  VERSION = '0.7.0'

  autoload :Application,      'perquackey/application'
  autoload :Console,          'perquackey/console'
  autoload :Dictionary,       'perquackey/dictionary'
  autoload :Game,             'perquackey/game'
  autoload :Server,           'perquackey/server'
  autoload :StringExtensions, 'perquackey/string_extensions'
  autoload :WordTable,        'perquackey/word_table'

  def self.datadir
    RbConfig.datadir('perquackey')
  end
end
