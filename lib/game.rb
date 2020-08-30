class Game
  attr_reader :computer, :user
  def initialize
    @computer = Computer.new
    @user = User.new
  end

  def main_menu
    welcome_line
    run_game
  end

  def welcome_line
    puts "Welcome to BATTLESHIP"
  end

  def run_game
    puts "Enter p to play. Enter q to quit"
    print "> "
    answer = gets.chomp.upcase
    if answer == "P"
      puts "Great! Let's play a fun game"
      computer_set_up
      user_set_up
      turn
      # puts computer.board.render(true)
      # puts user.board.render(true)
      # turn
      # end_game
      # break
    elsif answer == "Q"
      puts "We'll miss you. Hava a great day!"

      # stop_the_game
    else
      puts "Mind your p's and q's!!"
    end
  end

  def computer_set_up
    computer.place_cruiser
    computer.place_submarine
  end

  def user_set_up
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    user.place_cruiser
    user.place_submarine
  end

  def turn
    #loop do
      display_boards
      user_shot
      display_boards
      computer_shot
      display_boards
    #player choosing coordinates
    #computer choosing coordinates
    #reporting results of players shot
    #reporting results of computers shot
  end


  def display_boards
    puts "=============COMPUTER BOARD============="
    puts computer.board.render(true)
    puts "==============PLAYER BOARD=============="
    puts user.board.render(true)
  end

  def user_shot
    puts "Enter the coordinate for your shot: "
    print "> "
    loop do
      shot = gets.chomp.upcase
        if computer.board.valid_coordinate?(shot) && !(computer.board.cells[shot].fired_upon?)
          computer.board.cells[shot].fire_upon
          break
        else
          puts "Please enter a valid coordinate."
          print "> "
        end
    end
  end

  def computer_shot
    loop do
      shot = user.board.cells.keys.sample
      if user.board.valid_coordinate?(shot) && !(user.board.cells[shot].fired_upon?)
        user.board.cells[shot].fire_upon
        break
      end
    end
  end
end
