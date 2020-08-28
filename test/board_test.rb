require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_is_a_hash
    board = Board.new

    assert_equal Hash, board.cells.class
  end

  def test_it_has_16_cells
    board = Board.new

    assert_equal 16, board.cells.length
    refute_equal 15, board.cells.length
    refute_equal 17, board.cells.length
  end

  def test_the_values_are_cells
    board = Board.new

    board.cells

    assert_equal Cell, board.cells.values[1].class
  end

  def test_cell_is_unique
      board = Board.new

      board.cells

      assert_equal 16, board.cells.values.uniq.length
      assert_equal 16, board.cells.keys.uniq.length
  end
end
