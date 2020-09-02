require './lib/turn'

class Game
  attr_reader :computer, :user #, :user_ship_count, :computer_ship_count
  def initialize(computer, user)
    @computer = computer
    @user = user
  #   @computer_ship_count = 2
  #   @user_ship_count = 2
  end

  def main_menu
    welcome_line
    run_game
  end

  def welcome_line
    puts "Welcome to BATTLESHIP"
  end

  def run_game #start_game
    puts "Enter p to play. Enter q to quit"
    print "> "
    answer = gets.chop.chomp.upcase
    if answer == "P"
      puts "Great! Let's play a fun game"
      # computer_set_up
      # user_set_up
      #start_game
      play_game
      #evaluate_game
    elsif answer == "Q"
      puts "We'll miss you. Have a great day!"
    else
      puts "Mind your p's and q's!!"
      run_game
    end
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

  # def turn
  #   # loop do
  #     display_boards
  #     user_shot
  #     computer_shot
  #     evaluate_game
  #   # end
  # end

  def play_game #run_game
    count =1
    user_set_up
    computer_set_up
    while @computer.computer_ship_count > 0 || @user.user_ship_count > 0
      @turn = Turn.new(computer, user)
      @turn.display_boards
      @turn.user_shot
      # require 'pry';binding.pry
      @turn.computer_shot
      require 'pry';binding.pry
      evaluate_game
      count += 1
    end
    puts "This game was fought well on both sides."
    puts "It was however a draw"
  end

  # def display_boards
  #   puts "=============COMPUTER BOARD============="
  #   puts computer.board.render(true)
  #   puts "==============PLAYER BOARD=============="
  #   puts user.board.render(true)
  # end

  # def user_shot #user_turn
  #   puts "Enter the coordinate for your shot: "
  #   print "> "
  #   # loop do
  #     user_shot = gets.chomp.upcase
  #     #potential_user_inputs(user_shot)
  #     if computer.board.valid_coordinate?(user_shot) && !(computer.board.cells[user_shot].fired_upon?)
  #       computer.board.cells[user_shot].fire_upon
  #       puts "Your shot #{user_shot} was a #{shot_type(user_shot)}"
  #       # break
  #     elsif computer.board.valid_coordinate?(user_shot) && computer.board.cells[user_shot].fired_upon?
  #       puts "You've already fired on that coordinate. Please try again."
  #     else
  #       puts "Please enter a valid coordinate."
  #       print "> "
  #       user_shot
  #     end
  #   # end
  # end

  # def computer_shot #computer_turn
  #   loop do
  #     computer_shot = user.board.cells.keys.sample
  #     #potential_user_inputs(computer_shot)
  #     if user.board.valid_coordinate?(computer_shot) && !(user.board.cells[computer_shot].fired_upon?)
  #       user.board.cells[computer_shot].fire_upon
  #       puts "My shot #{computer_shot} was a #{shot_type(computer_shot)}"
  #       break
  #     end
  #   end
  # end

  # def shot_type(shot)
  #   if computer.board.cells[shot].render == "H" || user.board.cells[shot].render == "H"
  #     "hit."
  #   elsif computer.board.cells[shot].render == "X"
  #     @computer_ship_count -= 1
  #     "masterful shot. You sunk the ship!"
  #   elsif user.board.cells[shot].render == "X"
  #     @user_ship_count -= 1
  #     "masterful shot. You sunk the ship!"
  #   elsif computer.board.cells[shot].render == "M" || user.board.cells[shot].render == "M"
  #     "miss."
  #   end
  # end

  def evaluate_game
    @user.user_ship_count == 0 || @computer.computer_ship_count == 0
    end_game
  end

  def end_game
    if @user.user_ship_count == 0
      # @turn.display_boards
      puts "I win. Better luck, next time!!"
      puts "Would you like to play agian?"
      response = gets.chomp.upcase
      abort if response == "Q"
      play_game if response == "P"
    elsif @computer.computer_ship_count == 0
      # @turn.display_boards
      puts "You won! You bested me on my own turf!"
      puts "Would you like to play again?"
      puts "'P' to play again or 'Q' to quit"
      response = gets.chomp.upcase
      abort if response == "Q"
      play_game if response == "P"
    end
  end
  #
  # def good_bye
  #   "We hate to see you go!"
  #   abort
  # end
  #
  # def potential_user_inputs(input)
  #   end_the_game = {"Q" => good_bye, "quit" => good_bye, "Quit" => good_bye}
  #   end_the_game[input]
  #   good_bye
  # end
end
