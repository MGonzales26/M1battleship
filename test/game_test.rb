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
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_can_starts_there_is_a_welcome_message
     skip
    game = Game.new

    game.main_menu
    assert_equal game.main_menu, game.main_menu
  end

  def test_it_can_set_up_computer_ship_placement
    skip
    game = Game.new
    game.set_up

    assert_equal
  end

  def test_it_can_prompt_the_user_to_place_ships
    skip
    game = Game.new
  end

  def test_there_is_a_prompt_to_explain_placement
    skip
    game = Game.new
  end

  def test_there_is_a_blank_rendered_board_to_user
    skip
    game = Game.new
  end

  def test_there_is_visible_rendered_board_to_user_after_placement
    skip
    game = Game.new
  end

  def test_it_can_tell_user_invalid_placement
    skip
    game = Game.new
  end

  def test_it_can_end_the_game_when_both_user_ships_are_sunk
    skip
    game = Game.new
  end

  def test_it_can_end_the_game_when_both_computer_ships_are_sunk
    skip
    game = Game.new
  end

  def test_it_can_report_the_results_of_computer_winning
    skip
    game = Game.new
  end

  def test_it_can_report_results_of_user_winning
    skip
    game = Game.new
  end

  def test_it_can_prompt_user_to_play_again
    skip
    game = Game.new
  end

  def test_it_can_say_goodbye
    skip
    game = Game.new
  end

  def test_it_can_start_again
    skip
    game = Game.new
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
