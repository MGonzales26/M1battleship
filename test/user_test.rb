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

    assert_equal true, user.board.valid_placement?(cruiser, ["C1","C2","C3"])
    refute_equal false, user.board.valid_placement?(submarine, ["C1","C2"])
  end

  def test_it_can_place_a_submarine
    skip
    user = User.new
    board = Board.new
    submarine = Ship.new("Submarine", 2)
  end
end
