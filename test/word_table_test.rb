require 'test/helper'

class WordTableTest < Test::Unit::TestCase
  def test_handles_empty_list
    empty_table = Perquackey::WordTable.new %w()

    assert_equal [], empty_table.headers.to_a
    assert_equal [], empty_table.to_a
  end

  def test_handles_some_list
    table = Perquackey::WordTable.new %w(ape bear cat dog eagle fox goose hippo ibis)

    assert_equal [3, 4, 5], table.headers.to_a

    assert_equal [
      'ape bear eagle',
      'cat ibis goose',
      'dog      hippo',
      'fox           '
    ], table.collect { |row| row.join(' ') }
  end
end
