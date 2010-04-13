module Perquackey
  class Dictionary
    def initialize(path)
      @path = path
    end

    def words(letters)
      letters.extend(StringExtensions)

      File.open(@path) do |stream|
        stream.select { |word| letters.spell? word.chomp }.
              collect { |word| word.chomp }
      end
    end
  end
end
