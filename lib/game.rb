class Game
  attr_reader :computer, :user
  def initialize
    @computer = Computer.new
    @user = User.new
    @computer_ship_count = 2
    @user_ship_count = 2
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
    answer = gets.chop.chomp.upcase
    if answer == "P"
      puts "Great! Let's play a fun game"
      computer_set_up
      user_set_up
      turn
    elsif answer == "Q"
      puts "We'll miss you. Have a great day!"
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
    loop do
      display_boards
      user_shot
      computer_shot
      evaluate_game
    end
  end


  def display_boards
    puts "=============COMPUTER BOARD============="
    puts computer.board.render #(true)
    puts "==============PLAYER BOARD=============="
    puts user.board.render(true)
  end

  def user_shot
    puts "Enter the coordinate for your shot: "
    print "> "
    loop do
      user_shot = gets.chomp.upcase
      if computer.board.valid_coordinate?(user_shot) && !(computer.board.cells[user_shot].fired_upon?)
        computer.board.cells[user_shot].fire_upon
        puts "Your shot #{user_shot} was a #{shot_type(user_shot)}"
        if shot_type(user_shot) == "masterful shot. You sunk the ship!"
          @computer_ship_count -= 1
        end
        break
      elsif computer.board.valid_coordinate?(user_shot) && computer.board.cells[user_shot].fired_upon? 
        puts "You've already fired on that coordinate. Please try again."
      else
        puts "Please enter a valid coordinate."
        print "> "
      end
    end
  end

  def computer_shot
    loop do
      computer_shot = user.board.cells.keys.sample
      if user.board.valid_coordinate?(computer_shot) && !(user.board.cells[computer_shot].fired_upon?)
        user.board.cells[computer_shot].fire_upon
        puts "My shot #{computer_shot} was a #{shot_type(computer_shot)}"
        if shot_type(computer_shot) == "masterful shot. You sunk the ship!"
          @user_ship_count -= 1
        end
        break
      end
    end
  end

  def shot_type(shot)
    if computer.board.cells[shot].render == "H" || user.board.cells[shot].render == "H"
      "hit."
    elsif computer.board.cells[shot].render == "M" || user.board.cells[shot].render == "M"
      "miss."
    elsif computer.board.cells[shot].render == "X" || user.board.cells[shot].render == "X"
       "masterful shot. You sunk the ship!"
    end
  end

  def computer_count_empty?
    @computer_ship_count.zero?
  end

  def user_count_empty?
    @user_ship_count.zero?
  end

  def evaluate_game
    if user_count_empty? || computer_count_empty?
      end_game
    end
  end

  def end_game
    if @user_ship_count.zero?
      puts "I win. Better luck, next time!!"
      run_game
    elsif @computer_ship_count.zero?
      puts "You won! You bested me on my own turf!"
      run_game
    end
  end
end
