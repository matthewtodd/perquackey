module Perquackey
  class Dictionary
    def initialize
      @word_list = Perquackey.datadir.join('dict', 'TWL06.txt')
    end

    def words(letters)
      @word_list.open do |stream|
        stream.extend(Anagrams).anagrams(letters)
      end
    end
  end
end
