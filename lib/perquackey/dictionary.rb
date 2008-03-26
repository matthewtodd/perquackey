class Dictionary
  YAWL = File.join(File.dirname(__FILE__), 'resources', 'yawl-0.3.2-word.list')
  
  def initialize(source = File.new(YAWL))
    @source = Filter.new(source, :strip)
  end
  
  def words(letters)
    @source.rewind
    @source.select { |word| letters.spell? word }
  end
end