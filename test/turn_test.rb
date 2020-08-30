require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_it_exists
  end

  def test_both_userboard_and_computerboard_are_rendered_to_screen
  end

  def test_user_chooses_coordinate_to_fire_upon
  end

  def test_the_user_input_for_shot_is_invalid
  end

  def test_computer_chooses_coordinate_to_fire_upon
  end

  def test_the_computer_must_not_fire_on_cell_already_fired_upon
  end

  def test_it_can_report_results_of_players_shot_missed
  end

  def test_it_can_report_results_of_players_shot_hit
  end

  def test_it_can_report_results_of_players_shot_sunk
  end

  def test_it_can_tell_user_the_cell_has_been_fired_upon_before
  end

  def test_it_can_report_results_of_computers_shot
  end


end
