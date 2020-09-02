require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/turn'
require './lib/game'
require './lib/computer'
require './lib/user'
require './lib/turn'

computer = Computer.new
user = User.new
game = Game.new(computer, user)
game.main_menu
