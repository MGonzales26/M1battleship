class Game
  def initialize
  end

  def main_menu
    welcome_line
    welcome_prompt
  end

  def welcome_line
    puts "Welcome to BATTLESHIP"
  end

  def welcome_prompt
    puts "Enter p to play. Enter q to quit"
    print "> "
    answer = gets.chomp.upcase
    if answer == "P"
      puts "Great! Let's play a fun game"
      set_up
      break
    elsif answer == "Q"
      puts "We'll miss you. Hava a great day!"
      # stop_the_game
    else
      puts "Did you actually want to play?"
    end
  end

  def set_up
    puts "were playing"
    computer_set_up
  end

  def computer_set_up
    comp_board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)


    comp_board.place(cruiser, spots)
  end

  def random_cruiser_spots(ship_type) #array with 3 coordinates
    available_spots = comp_board.cells.values.select do |cell|
      cell.ship.nil?
    end
    cruiser_spots = available_spots.select do |spot|

  end

  def random_submarine_spots
  end
end
