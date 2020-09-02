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

  def test_both_userboard_and_computerboard_are_rendered_to_screen
    skip
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)
    board = Board.new

  end

  def test_user_chooses_coordinate_to_fire_upon
    skip
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)

    
  end

  def test_the_user_input_for_shot_is_invalid
    skip
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)
  end

  def test_computer_chooses_coordinate_to_fire_upon
    skip
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)
  end

  def test_the_computer_must_not_fire_on_cell_already_fired_upon
    skip
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)
  end

  def test_it_can_report_results_of_players_shot_missed
    skip
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)
  end

  def test_it_can_report_results_of_players_shot_hit
    skip
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)
  end

  def test_it_can_report_results_of_players_shot_sunk
    skip
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)
  end

  def test_it_can_tell_user_the_cell_has_been_fired_upon_before
    skip
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)
  end

  def test_it_can_report_results_of_computers_shot
    skip
    computer = Computer.new
    user = User.new
    turn = Turn.new(computer, user)
  end


end
