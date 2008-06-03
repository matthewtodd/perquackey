class Perquackey::Game
  def initialize
    @dictionary = Perquackey::Dictionary.new
  end
  
  def words(letters)
    Perquackey::WordTable.new(@dictionary.words(letters).reject { |word| word.length < minimum_length(letters) })
  end
  
  private
  
  def minimum_length(letters)
    letters.length > 10 ? 4 : 3
  end
end
