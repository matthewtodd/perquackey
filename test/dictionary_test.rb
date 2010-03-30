require 'test_helper'

class DictionaryTest < Test::Unit::TestCase
  def test_simple_search_with_twl
    assert_equal ['ab', 'ba', 'cab'], Perquackey::Dictionary.new(Perquackey::Game::TWL).words('abc')
  end

  def test_simple_search_with_yawl
    assert_equal ['ab', 'ba', 'cab'], Perquackey::Dictionary.new(Perquackey::Game::YAWL).words('abc')
  end
end
