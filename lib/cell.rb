class Cell
  attr_reader :coordinate, :ship, :empty, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  def empty?
    @empty = @ship == nil
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if ship != nil
      ship.hit
    end
    @fired_upon = true
  end

  def render
    #if (!empty, fired upon and sunk)
    #elsif (empty! and fired upon)
    if empty? == true && fired_upon? == true
      "M"
    elsif empty? == true && fired_upon? == false
      "."
    end
  end
end
