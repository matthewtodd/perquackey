module Perquackey
  class Dictionary
    def initialize
      @word_list = Perquackey.datadir.join('dict', 'TWL06.txt')
    end

    def words(letters)
      anagrams = @word_list.open do |stream|
        stream.extend(Anagrams).anagrams(letters)
      end

      minimum = letters.length <= 10 ? 3 : 4
      anagrams.reject { |anagram| anagram.length < minimum }
    end
  end
end
