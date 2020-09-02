require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/turn'
require './lib/game'
require './lib/computer'
require './lib/user'

class GameTest < Minitest::Test
  def test_it_exists
    computer = Computer.new
    user = User.new
    game = Game.new(computer, user)

    assert_instance_of Game, game
  end

  def test_it_can_starts_there_is_a_welcome_message
     # skip
    computer = Computer.new
    user = User.new
    game = Game.new(computer, user)

    game.main_menu
    assert_equal game.run_game, game.main_menu
  end

  def test_shot_type_renders_a_ship
    game = Game.new
    computer = Computer.new
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("A1")
    cell_2 = Cell.new("A2")
    cell_3 = Cell.new("A3")

    game.computer.board.cell.place(cruiser, ["A1", "A2", "A3"])

    assert_equal "H", game.shot_type("A1")
  end

end
