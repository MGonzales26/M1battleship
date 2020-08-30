class Computer
  attr_reader :board, :cruiser, :submarine
  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def place_cruiser
    loop do
      cruiser_spots = []
      until cruiser_spots.length == crusier.length do
        cruiser.spots << board.cells.keys.sample
      end
      if board.valid_placement(cruiser, cruiser_spots)
        board.place(cruiser, cruiser_spots)
        break
      end
    end
  end

  def place_submarine
    loop do
      submarine_spots = []
      until submarine_spots.length == submarine.length do
        submarine.spots << board.cells.keys.sample
      end
      if board.valid_placement(submarine, submarine_spots)
        board.place(submarine, submarine_spots)
        break
      end
    end
  end
end
