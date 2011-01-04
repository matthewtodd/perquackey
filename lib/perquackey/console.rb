require 'readline'

module Perquackey
  class Console
    def self.run!
      new.run
    end

    def initialize
      @dictionary = Dictionary.new
    end

    def run
      puts 'Type ctrl-d or quit to exit.'

      loop do
        case letters = Readline::readline('> ')
        when nil, 'quit'
          puts 'Goodbye.'
          exit
        when /^[a-z]+$/
          Readline::HISTORY.push(letters)
          puts Table.new(@dictionary.words(letters))
        else
          next
        end
      end
    end
  end
end
