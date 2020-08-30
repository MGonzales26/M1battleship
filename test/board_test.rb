require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    # skip
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_is_a_hash
    # skip
    board = Board.new

    assert_equal Hash, board.cells.class
  end

  def test_it_has_16_cells
    # skip
    board = Board.new

    assert_equal 16, board.cells.length
    refute_equal 15, board.cells.length
    refute_equal 17, board.cells.length
  end

  def test_the_values_are_cells
    # skip
    board = Board.new

    assert_equal Cell, board.cells.values[1].class
  end

  def test_cell_is_unique
      # skip
    board = Board.new

    assert_equal 16, board.cells.values.uniq.length
    assert_equal 16, board.cells.keys.uniq.length
  end

  def test_it_is_a_valid_coordinate
    # skip
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
  end

  def test_is_not_valid_and_outside_board
    # skip
    board = Board.new

    assert_equal false, board.valid_coordinate?("Q1")
    assert_equal false, board.valid_coordinate?("A6")
  end

  def test_is_not_a_valid_placement_lengths_not_equal
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "A2","A3"])
  end

  def test_validate_lengths_are_equal
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.coordinate_equal?(submarine, ["D1", "D2"])
    assert_equal true, board.coordinate_equal?(cruiser, ["A1", "A2","A3"])
    assert_equal true, board.valid_placement?(submarine, ["D1", "D2"])
    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2","A3"])
  end

  def test_is_a_valid_placement
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2","A3"])
    assert_equal true, board.valid_placement?(submarine, ["D1", "D2"])
  end

  def test_coordinates_are_consecutive_numbers_or_not
    # skip
    board = Board.new

    assert_equal true, board.consecutive_numbers?(["C1", "C2", "C3"])
    assert_equal false, board.consecutive_numbers?(["A3", "B3", "C3"])
  end

  def test_coordinates_are_consecutive_letters_or_not
    # skip
    board = Board.new

    assert_equal false, board.consecutive_letters?(["C1", "C2", "C3"])
    assert_equal true, board.consecutive_letters?(["A3", "B3", "C3"])
  end

  def test_all_letters_same_method_works_both_ways
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.all_letters_same?(["A1", "A2","B3"])
    assert_equal true, board.all_letters_same?(["A1", "A2","A3"])
  end

  def test_all_numbers_same_method_works_both_ways
    # skip
    board = Board.new

    assert_equal true, board.all_numbers_same?(["A2", "B2","C2"])
    assert_equal false, board.all_numbers_same?(["A2", "B2","C3"])
  end

  def test_it_can_find_all_digits
    # skip
    board = Board.new

    assert_equal [2, 3, 4], board.find_digits(["D2", "D3", "D4"])
    assert_equal [2, 2, 2], board.find_digits(["B2", "C2", "D2"])
  end

  def test_it_can_find_all_letters
    # skip
    board = Board.new

    assert_equal [68, 68, 68], board.find_letters(["D2", "D3", "D4"])
    assert_equal [66, 67, 68], board.find_letters(["B2", "C2", "D2"])
  end

  def test_it_can_make_a_standard_ord_number_array
    # skip
    board = Board.new

    assert_equal [65, 66, 67, 68], board.make_letters_ord_numbers
    # assert_equal [65, 66, 67, 68, 69, 70], board.make_letters_ord_numbers
  end

  def test_consecutive_numbers_true_and_all_letters_same
    # skip
    board = Board.new

    assert_equal true, board.valid_numbers?(["D2", "D3", "D4"])
    assert_equal false, board.valid_numbers?(["B4", "C4", "D4"])
  end

  def test_consecutive_letters_true_and_all_numbers_same
    # skip
    board = Board.new

    assert_equal false, board.valid_letters?(["D2", "D3", "D4"])
    assert_equal true, board.valid_letters?(["B4", "C4", "D4"])
  end

  def test_place_method
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship
  end

  def test_it_has_the_same_ship_for_all_coordinates_given
    # skip
    board = Board.new
    submarine = Ship.new("Submarine", 2)
    board.place(submarine, ["A1", "A2"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]

    assert_equal true, cell_1.ship == cell_2.ship
  end

  def test_it_can_place_another_ship
    # skip
    board = Board.new
    submarine = Ship.new("Submarine", 2)
    board.place(submarine, ["A1", "A2"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]

    assert_equal submarine, cell_1.ship
    assert_equal submarine, cell_1.ship
  end

  def test_it_a_cell_cannot_have_overlapping_ships
    # skip
    board = Board.new
    submarine = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    # assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
    board.place(cruiser, ["A1", "A2", "A3"])
    board.place(submarine, ["A1", "B1"])

    assert_equal false, board.valid_placement?(submarine, ["A1", "B1"])
  end

  def test_it_can_find_overlap_in_different_coordinates
    # skip
    board = Board.new
    submarine = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["D1", "D2", "D3"])
    board.place(submarine, ["D2", "D3"])

    assert_equal false, board.valid_placement?(submarine, ["D2", "D3"])
  end

  def test_it_can_render_the_current_board
    # skip
    board = Board.new

    assert_equal " 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", board.render
  end
  def test_it_can_render_the_current_board_not_showing_ship
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["D1", "D2", "D3"])

    assert_equal " 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", board.render
  end

  def test_it_can_render_a_board_with_a_ship
    #
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["D1", "D2", "D3"])

    assert_equal " 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD S S S . \n", board.render(true)
  end

end
