require 'test_helper'

class DictionaryTest < Test::Unit::TestCase
  def test_simple_search
    assert_equal ['ab', 'ba', 'cab'], Perquackey::Dictionary.new(Perquackey::Game::YAWL).words('abc')
  end
end