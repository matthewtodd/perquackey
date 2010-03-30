module Perquackey
  autoload :Dictionary, 'perquackey/dictionary'

  class Game
    TWL = File.expand_path('../perquackey/resources/TWL06.txt', __FILE__)

    def initialize
      @dictionary = Dictionary.new(TWL)
    end

    def words(letters)
      WordTable.new(@dictionary.words(letters).reject { |word| word.length < minimum_length(letters) })
    end

    private

    def minimum_length(letters)
      letters.length > 10 ? 4 : 3
    end
  end

  class WordTable
    include Enumerable

    def initialize(list=[])
      @table = Hash.new { |h, k| h[k] = [] }

      list.each do |word|
        @table[word.length] << word
      end

      if @table.empty?
        @headers = []
        @height  = 0
      else
        @headers = @table.keys.min .. @table.keys.max
        @height  = @table.values.max { |a, b| a.length <=> b.length }.length
      end
    end

    def headers
      @headers
    end

    def each
      @height.times do |row_number|
        yield headers.collect { |length| @table[length][row_number] or ' ' * length}
      end
    end
  end
end
