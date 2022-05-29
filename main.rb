class Board
  def initialize
    @board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    @game_over = false
    @available_moves = 9

    create_board
  end

  attr_accessor :board_array, :available_moves
  attr_writer :game_over
  attr_reader :winning_combinations

  private

  def create_line
    puts '---+---+---'
  end

  def create_board
    puts "\n"

    board_array.each_with_index do |current_value, index|
      if [2, 5, 8].include?(index)
        puts " #{current_value}"
        create_line

      else
        print " #{current_value} |"
      end
    end
  end

  def place_move_helper(move, player)
    unless stalemate?
      move_index = board_array.index(move)

      if move_index.nil?
        puts 'Invalid choice, try again!'

      else
        board_array[move_index] = player.player_symbol
        self.available_moves -= 1
        winner?(player)
      end

      create_board

    else
      puts "The game has ended in a stalemate"
      reset_game
  end

  def winner?(player)
    if winning_combinations.any? do |combination|
         combination.all? do |index|
           board_array[index] == player.player_symbol
         end
       end
      puts "#{player.name} HAS WON THE GAME!"
      self.game_over = true
      true
    end
  end

  def stalemate?
    available_moves <= 0
  end

  def reset_game
    puts "Would you like to play again[y/n]"
    user_input = gets.chomp.downcase

    if user_input == "y"
      game_over = false
      available_moves = 9
      board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      create_board
    else
      exit
    end
  end

  public

  def place_move(move, player)
    place_move_helper(move, player)
  end

class Player
  attr_reader :player_symbol, :name

  def initialize(name, symbol)
    @name = name
    @player_symbol = symbol
  end
end

new_board = Board.new
player = Player.new('Aarya', 'X')

while 1
  puts "\nEnter a choice: "
  user_choice = gets.chomp.to_i
  new_board.place_move(user_choice, player)
end
