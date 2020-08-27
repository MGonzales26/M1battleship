require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

class CellTest < Minitest::Test
  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end


  def test_has_coordinate
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_it_has_a_ship
    cell = Cell.new("B4")

    assert_equal nil, cell.ship
  end

  def test_it_is_empty
    cell = Cell.new("B4")

    assert_equal true, cell.empty?
  end

  def test_place_ship
    # skip
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_equal cruiser, cell.ship
  end

  def test_that_if_ship_placed_cell_not_empty
    cell = Cell.new("B4")
    submarine = Ship.new("Submarine", 2)

    cell.place_ship(submarine)

    assert_equal false, cell.empty?
    assert_equal submarine, cell.ship
  end

  def test_it_has_attributes
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
    assert_equal nil, cell.ship
    assert_equal true, cell.empty
  end

  def test_it_begins_not_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, cell.fired_upon?
  end
end
