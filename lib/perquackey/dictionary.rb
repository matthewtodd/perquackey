module Perquackey
  class Dictionary
    def initialize(path)
      @path = path
    end

    def words(letters)
      letters.extend StringExtensions

      File.open(@path) do |stream|
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
