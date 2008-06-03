class Perquackey::WordTable
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