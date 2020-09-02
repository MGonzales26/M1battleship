require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/board'
require './lib/cell'
require './lib/ship'


class UserTest < Minitest::Test
  def test_it_exists
    user = User.new

    assert_instance_of User, user
  end

  def test_it_has_attributes
    user = User.new
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    # assert_equal board, user.board
    # assert_equal cruiser, user.cruiser
    # assert_equal submarine, user.submarine
    assert_equal 2, user.ship_count
  end
  def test_it_can_place_a_cruiser
    # skip
    cells = []
    board = Board.new
    cell_1 = Cell.new("C1")
    cells << cell_1
    cell_2 = Cell.new("C2")
    cells << cell_2
    cell_3 = Cell.new("C3")
    cells << cell_3
    user = User.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, user.board.valid_placement?(cruiser, ["C1", "C2","C3"])
    refute_equal false, user.board.valid_placement?(submarine, ["C1","C2"])
    assert_equal [cruiser, cruiser, cruiser], board.place(cruiser, ["C1", "C2", "C3"])
    refute_equal [cruiser, cruiser], board.place(cruiser, ["C1", "C2", "C3"])
    refute_equal [cruiser, cruiser, cruiser, cruiser], board.place(cruiser, ["C1", "C2", "C3"])
  end

  def test_it_can_place_a_submarine
    # skip
    spots = []
    board = Board.new
    cell_1 = Cell.new("C1")
    spots << cell_1
    cell_2 = Cell.new("C2")
    spots << cell_2
    user = User.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, user.board.valid_placement?(submarine, ["C1","C2"])
    refute_equal false, user.board.valid_placement?(cruiser, ["C1","C2","C3"])
    assert_equal [submarine, submarine], board.place(submarine, ["C1","C2"])
    refute_equal [submarine, submarine, submarine], board.place(submarine, ["C1","C2"])
    refute_equal [submarine], board.place(submarine, ["C1","C2"])
  end

  def test_it_can_render_the_board_with_a_cruiser
    # skip
    user = User.new
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["D1", "D2", "D3"])

    assert_equal " 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD S S S . \n", board.render(true)
    refute_equal " 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", board.render(true)
  end

  def test_it_can_render_the_board_with_a_submarine
    # skip
    user = User.new
    board = Board.new
    submarine = Ship.new("Submarine", 2)
    board.place(submarine, ["D1", "D2"])

    assert_equal " 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD S S . . \n", board.render(true)
    refute_equal " 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", board.render(true)
  end
end
