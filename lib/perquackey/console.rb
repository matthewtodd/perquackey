require 'perquackey'
require 'readline'

module Perquackey
  class Console
    def self.run!
      new.run
    end

    def initialize
      @game = Perquackey::Game.new
    end

    def run
      puts 'Type ctrl-d or quit to exit.'

      loop do
        letters = prompt_for_letters

        case letters
        when nil, 'quit'
          puts 'Goodbye.'
          exit
        when /^[a-z]+$/
          Readline::HISTORY.push(letters)
          puts words(letters)
        else
          next
        end
      end
    end

    private

    def prompt_for_letters
      Readline::readline('> ')
    end

    def words(letters)
      @game.words(letters).map { |row| row.join(' ') }
    end
  end
end
