module Perquackey
  class Dictionary
    TOURNAMENT_WORD_LIST = Perquackey.datadir.join('dict', 'TWL06.txt')

    def initialize
      @word_list = TOURNAMENT_WORD_LIST
    end

    def words(letters)
      letters.extend StringExtensions

      @word_list.open do |stream|
        stream.extend Chomped
        stream.select { |word| letters.spell? word }
      end
    end

    private

    module Chomped
      def each
        super { |string| yield string.chomp }
      end
    end
  end
end
