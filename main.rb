require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/player'

def create_user(number)
  puts "Player #{number}, enter your details"
  print "\tName: "
  name = gets.chomp
  print "\tSymbol: "
  symbol = gets.chomp
  Player.new(name, symbol)
end

puts "Welcome to Tic-Tac-Toe\n\n"
player_one = create_user(1)
player_two = create_user(2)
system('clear')

Game.new(player_one, player_two).play_game

