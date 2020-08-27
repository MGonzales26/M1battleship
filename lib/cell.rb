class Cell
  attr_reader :coordinate, :ship, :empty, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  def empty?
    @empty = @ship.nil? #thanks aiden
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
