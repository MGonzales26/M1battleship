require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/turn'
require './lib/game'
require './lib/computer'

class ComputerTest < Minitest::Test
  def test_it_exists
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_can_place_a_cruiser
    # skip
    board = Board.new
    computer = Computer.new
    cruiser = Ship.new("Cruiser", 3)

    computer.place_cruiser
    # cell_count = board.cells.values.count do |cell|
      # require 'pry';binding.pry
      # !(board.cells[cell].ship.nil?)
    # end
#ship is not nil
    # assert_equal 3, cell_count
    assert_equal true, board.valid_placement?(cruiser, cruiser_spots)
  end

  def test_it_can_place_a_submarine
    skip
    board = Board.new
    computer = Computer.new
    submarine = Submarine("Submarine", 2)

    computer.place_cruiser

    assert_equal
  end

end
