require File.join(File.dirname(__FILE__), '..', 'test_helper')

class FastDictionaryTest < Test::Unit::TestCase
  def test_should_give_the_same_results_as_normal_dictionary
    assert_equal ['ab', 'ba', 'cab'], FastDictionary.new.words('abc')
  end
end