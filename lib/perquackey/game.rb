module Perquackey
  class Game
    def initialize
      @dictionary = Dictionary.new
    end

    def words(letters)
      Table.new(@dictionary.words(letters))
    end
  end
end
