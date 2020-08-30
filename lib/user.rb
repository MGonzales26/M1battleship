class User
  attr_reader :board, :cruiser, :submarine
  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @start_number_of_ships = 2
  end

  def place_cruiser
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts board.render
    puts "Enter the squares for the Cruiser (3 spaces): "
    print "> "
    loop do
      spots = gets.chomp.upcase.gsub(", ", " ").split
      if board.valid_placement?(cruiser, spots)
        board.place(cruiser, spots)
        puts "You did it! You're selection is valid!"
        break
      else
        puts "Invalid response. Please try again."
      end
    end
  end

  def place_submarine
  end
end
