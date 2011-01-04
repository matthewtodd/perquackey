require 'test/helper'

class DictionaryTest < Test::Unit::TestCase
  def test_simple_search
    assert_equal ['cab'], Perquackey::Dictionary.new.words('abc')
  end
end
