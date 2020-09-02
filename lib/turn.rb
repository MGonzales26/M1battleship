
class Turn
  attr_reader :computer, :user
  def initialize(computer, user)
    @computer = computer
    @user = user
  end

  def computer_set_up
    @computer.place_cruiser
    @computer.place_submarine
  end

  def user_set_up
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    @user.place_cruiser
    @user.place_submarine
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render(true)
    puts "==============PLAYER BOARD=============="
    puts @user.board.render(true)
  end

  def user_shot #user_turn
    puts "Enter the coordinate for your shot: "
    print "> "
    loop do
      user_shot = gets.chomp.upcase
      if @computer.board.valid_coordinate?(user_shot) && !(@computer.board.cells[user_shot].fired_upon?)
        @computer.board.cells[user_shot].fire_upon
        puts "Your shot #{user_shot} was a #{shot_type(user_shot)}"
        break
      elsif @computer.board.valid_coordinate?(user_shot) && @computer.board.cells[user_shot].fired_upon?
        puts "You've already fired on that coordinate. Please try again."
      else
        puts "Please enter a valid coordinate."
        print "> "
        # user_shot
      end
    end
  end

  def computer_shot #computer_turn
    loop do
      computer_shot = user.board.cells.keys.sample
      if @user.board.valid_coordinate?(computer_shot) && !(@user.board.cells[computer_shot].fired_upon?)
        @user.board.cells[computer_shot].fire_upon
        puts "My shot #{computer_shot} was a #{shot_type(computer_shot)}"
        break
      end
    end
  end

  def shot_type(shot)
    if @computer.board.cells[shot].render == "H" || @user.board.cells[shot].render == "H"
      "hit."
    elsif @computer.board.cells[shot].render == "X"
      # require 'pry';binding.pry
      @computer.computer_ship_count -= 1
      "masterful shot. You sunk the ship!"
    elsif user.board.cells[shot].render == "X"
      @user.user_ship_count -= 1
      "masterful shot. The ship is sunk!"
    elsif @computer.board.cells[shot].render == "M" || @user.board.cells[shot].render == "M"
      "miss."
    end
  end

  # def evaluate_game
  #   if @user_ship_count == 0 || @computer_ship_count == 0
  #     end_game
  #   end
  # end
  #
  # def end_game
  #   display_boards
  #   if @user_ship_count == 0
  #     puts "I win. Better luck, next time!!"
  #     puts "Would you like to play agian?"
  #     response = gets.chomp.upcase
  #     abort if response == "Q"
  #     game.main_menu if response == "P"
  #   elsif @computer_ship_count == 0
  #     puts "You won! You bested me on my own turf!"
  #     puts "Would you like to play again?"
  #     puts "'P' to play again or 'Q' to quit"
  #     response = gets.chomp.upcase
  #     abort if response == "Q"
  #     game.main_menu if response == "P"
  #   end
  # end
end
