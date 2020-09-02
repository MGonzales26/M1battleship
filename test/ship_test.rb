require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_does_it_exist
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_has_name
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", cruiser.name
    refute_equal "Submarine", cruiser.name
  end

  def test_has_length
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.length
    refute_equal 2, cruiser.length
  end

  def test_has_health_equal_to_length_to_start
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.health
    refute_equal 2, cruiser.health
    refute_equal 4, cruiser.health
  end

  def test_is_not_sunk_at_start
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, cruiser.sunk
    refute_equal true, cruiser.sunk
  end

  def test_hit_lowers_health
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit

    assert_equal 2, cruiser.health
    refute_equal 1, cruiser.health
    refute_equal 3, cruiser.health
  end

  def test_health_is_lower_but_yet_not_sunk
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    cruiser.hit

    assert_equal 1, cruiser.health
    refute_equal 2, cruiser.health
    refute_equal 0, cruiser.health
  end

  def test_ship_sinks_at_zero_health
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    cruiser.hit
    cruiser.hit

    assert_equal 0, cruiser.health
    assert_equal true, cruiser.sunk?
  end
end
