class Perquackey::Game
  YAWL = File.join(File.dirname(__FILE__), '..', '..', 'resources', 'yawl-0.3.2-word.list')

  def initialize
    @dictionary = Perquackey::Dictionary.new(YAWL)
  end

  def words(letters)
    Perquackey::WordTable.new(@dictionary.words(letters).reject { |word| word.length < minimum_length(letters) })
  end

  private

  def minimum_length(letters)
    letters.length > 10 ? 4 : 3
  end
end
