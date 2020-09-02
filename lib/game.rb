require './lib/turn'

class Game
  attr_reader :computer, :user
  def initialize(computer, user)
    @computer = computer
    @user = user
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
      play_game
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

  def play_game
    count =1
    user_set_up
    computer_set_up
    while @computer.ship_count > 0 || @user.ship_count > 0
      @turn = Turn.new(computer, user)
      @turn.display_boards
      @turn.user_shot
      @turn.computer_shot
      evaluate_game
      count += 1
    end
    puts "This game was fought well on both sides."
    puts "It was however a draw"
  end

  def evaluate_game
    @turn.evaluate_computer_ships
    @turn.evaluate_user_ships
    @user.ship_count == 0 || @computer.ship_count == 0
    end_game
  end

  def end_game
    user_looses
    computer_looses
  end

  def user_looses
    if @user.ship_count == 0
      puts "I win. Better luck, next time!!"
      puts "Would you like to play agian?"
      response = gets.chomp.upcase
      abort if response == "Q"
      play_game if response == "P"
    end
  end

  def computer_looses
    if @computer.ship_count == 0
      puts "You won! You bested me on my own turf!"
      puts "Would you like to play again?"
      puts "'P' to play again or 'Q' to quit"
      response = gets.chomp.upcase
      abort if response == "Q"
      main_menu if response == "P"
    end
  end
end
