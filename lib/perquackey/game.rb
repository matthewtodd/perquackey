class Game
  def initialize
    @dictionary = Dictionary.new
  end
  
  def words(letters)
    WordTable.new(@dictionary.words(letters).reject { |word| word.length < minimum_length(letters) })
  end
  
  private
  
  def minimum_length(letters)
    letters.length > 10 ? 4 : 3
  end
end
