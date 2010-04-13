module Perquackey
  class Dictionary
    TOURNAMENT_WORD_LIST = Perquackey.datadir.join('dict', 'TWL06.txt')

    def initialize
      @word_list = TOURNAMENT_WORD_LIST
    end

    def words(letters)
      @word_list.open do |stream|
        stream.extend(Anagrams).anagrams(letters)
      end
    end
  end
end
