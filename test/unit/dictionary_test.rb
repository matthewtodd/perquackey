require File.join(File.dirname(__FILE__), '..', 'test_helper')

class DictionaryTest < Test::Unit::TestCase
  def test_simple_search
    assert_equal ['ab', 'ba', 'cab'], Dictionary.new.words('abc')
  end
end