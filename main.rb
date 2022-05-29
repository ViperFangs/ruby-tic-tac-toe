class Board
  def initialize
    default_values
    create_board
  end

  attr_accessor :board_array, :available_moves
  attr_writer :game_over
  attr_reader :winning_combinations

  private

  def create_line
    puts '---+---+---'
  end

  def default_values
    @board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    @game_over = false
    @available_moves = 9
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
    move_index = board_array.index(move)

    if move_index.nil?
      puts 'Invalid choice, try again!'

    else
      board_array[move_index] = player.player_symbol
      self.available_moves -= 1
      winner?(player)
    end

    create_board
  end

  def winner?(player)
    if winning_combinations.any? { |combination| combination.all? { |index| board_array[index] == player.player_symbol } } 
      puts "\n#{player.name.upcase} HAS WON THE GAME!"
      self.game_over = true
      reset_game
      return true
    end
    stalemate?
  end

  def stalemate?
    return false if available_moves > 0

    puts "\nThe game has ended in a stalemate"
    reset_game
  end

  def reset_game
    print "\nWould you like to play again [y/n]: "
    user_input = gets.chomp.downcase

    exit unless user_input == 'y'

    default_values
    system('clear')
    true
  end

  public

  def place_move(move, player)
    place_move_helper(move, player)
  end
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
  print "\nEnter a choice: "
  user_choice = gets.chomp.to_i
  new_board.place_move(user_choice, player)
end
