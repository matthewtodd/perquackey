module Perquackey
  class Dictionary
    def self.words(letters)
      new.words(letters)
    end

    def initialize
      @word_list = Perquackey.datadir.join('dict', 'TWL06.txt')
    end

    def words(letters)
      anagrams = @word_list.open do |stream|
        stream.extend(Anagrams)
        stream.enum_for(:each_anagram, letters).to_a
      end

      minimum = (letters.length <= 10) ? 3 : 4
      anagrams.reject { |anagram| anagram.length < minimum }
    end
  end
end
