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
  end
end
