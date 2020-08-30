require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/turn'
require './lib/game'

class ComputerTest < Minitest::Test
  def test_it_exists
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_can_place_a_cruiser
    skip
    board = Board.new
    computer = Computer.new
    cruiser = Ship.new("Cruiser", 3)

    computer.place_cruiser

    assert_equal 
  end

  def test_it_can_place_a_submarine
    skip
    computer = Computer.new
  end

end
