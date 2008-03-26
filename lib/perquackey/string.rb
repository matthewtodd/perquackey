class String
  def letters
    unpack 'c*'
  end
  
  def spell?(word)
    available = letters
    word.letters.each { |letter| return false unless available.delete_first(letter) }
    return true
  end
end
