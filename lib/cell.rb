class Cell
  attr_reader :coordinate, :ship, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    # @empty = true
    @fired_upon = false
  end

  def empty?
    @ship.nil? #thanks aiden
  end

  def place_ship(ship_type)
    @ship = ship_type
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

  def render(shown=false)
    if shown == true && !empty? && !fired_upon?
      "S"
    elsif !empty? && fired_upon? && ship.sunk?
      "X"
    elsif !empty? && fired_upon?
      "H"
    elsif empty? && fired_upon?
      "M"
    elsif empty? && !fired_upon?
      "."
    end
  end
end
