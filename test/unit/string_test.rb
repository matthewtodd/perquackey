require File.join(File.dirname(__FILE__), '..', 'test_helper')

class StringTest < Test::Unit::TestCase
  def self.letters(letters)
    @letters = letters
  end

  def self.spell(*words)
    letters = @letters

    words.each do |word|
      define_method("test_#{letters}_should_spell_#{word}") do
        assert letters.spell?(word)
      end
    end
  end

  def self.do_not_spell(*words)
    letters = @letters

    words.each do |word|
      define_method("test_#{letters}_should_not_spell_#{word}") do
        assert !letters.spell?(word)
      end
    end
  end

  letters 'abcde'
  spell 'cab'
  do_not_spell 'bar', 'babe', 'abcdef'
end