require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require './lib/turn'
require './lib/computer'
require './lib/user'

class TurnTest < Minitest::Test
  def test_it_exists
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    skip
    turn = Turn.new(computer, user)
    computer = Computer.new
    user = User.new

    assert_equal computer, turn.computer
    assert_equal user, turn.user
  end

  def test_it_can_set_up_the_computer_side #already tested in computer
    # skip
    computer = Computer.new
    user = User.new
    game = Game.new(computer, user)
    turn = Turn.new(computer, user)
    cells = []
    board = Board.new
    cell_1 = Cell.new("D1")
    cells << cell_1
    cell_2 = Cell.new("D2")
    cells << cell_2
    cell_3 = Cell.new("D3")
    cells << cell_3
    cell_4 = Cell.new("A2")
    cells << cell_4
    cell_5 = Cell.new("A3")
    cells << cell_5
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    turn.computer_set_up

    actual_1 = turn.computer.place_cruiser#(cruiser, ["D1", "D2", "D3"])
    assert_equal [cruiser, cruiser, cruiser], actual_1
    actual_2 = turn.computer.place_submarine #(submarine, ["A2", "A3"])
    assert_equal [submarine, submarine], actual_2
  end

  def test_the_computer_can_shoot
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)
    cells = []
    cell_1 = Cell.new("D1")
    cells << cell_1
    cell_2 = Cell.new("D2")
    cells << cell_2
    cell_3 = Cell.new("D3")
    cells << cell_3
    cell_4 = Cell.new("A2")
    cells << cell_4
    cell_5 = Cell.new("A3")
    cells << cell_5
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)


    computer_shot = "A3"

    response = "My shot A3 was a hit"
    assert_equal nil, turn.computer_shot
    assert_equal turn.user.board.cells[computer_shot].fire_upon
  end
