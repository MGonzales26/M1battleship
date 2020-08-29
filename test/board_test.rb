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

  def test_it_is_a_valid_coordinate
    board = Board.new

    board.cells

    assert_equal true, board.valid_coordinate?("A1")
  end

  def test_is_not_valid_and_outside_board
    board = Board.new

    board.cells

    assert_equal false, board.valid_coordinate?("Q1")
    assert_equal false, board.valid_coordinate?("A6")
  end

  def test_is_not_a_valid_placement_lengths_not_equal
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.cells

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "A2","A3"])
  end

  def test_is_a_valid_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.cells

    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2","A3"])
    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
  end

  def test_coordinates_are_not_consecutive_numbers
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.cells

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2","A4"])
  end
end
