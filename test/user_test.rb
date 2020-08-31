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
    user = User.new
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    user.place_cruiser
    cell_1 = board.cells["C1"]
    cell_2 = board.cells["C2"]
    cell_3 = board.cells["C3"]

    assert_equal cruiser, cell_1.ship
  end

  def test_it_can_place_a_submarine
    skip
    user = User.new
    board = Board.new
    submarine = Ship.new("Submarine", 2)
  end
end
