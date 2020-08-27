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

  def test_it_can_fire_upon
    skip
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.fired_upon
  end

  def test_fire_upon_damages_ship
    # skip
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    assert_equal 2, cell.ship.health
  end

  def test_it_only_decreases_by_one_for_every_hit
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    refute_equal 1, cell.ship.health
  end

  def test_it_doesnt_increase_in_health_with_a_hit
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    refute_equal 4, cell.ship.health
  end

  def test_fire_upon_changes_fired_upon?
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    assert_equal true, cell.fired_upon?
  end

  def test_can_render_period_when_empty_and_not_fired_upon
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    assert_equal ".", cell_1.render
  end

  def test_can_render_period_when_empty_and_not_fired_upon
    # skip
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    refute_equal "M", cell_1.render
  end

  def test_can_miss_when_empty_and_fired_upon
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell_1.fire_upon

    assert_equal "M", cell_1.render
    refute_equal ".", cell_1.render
  end

  def test_can_hit_when_fired_upon_and_ship_present
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_1.fire_upon


  end
end
