module Perquackey
  class Game
    def initialize
      @dictionary = Dictionary.new
    end

    def words(letters)
      WordTable.new(@dictionary.words(letters))
    end
  end
end
