class Board
  def initialize
    default_values
    create_board
  end

  attr_accessor :board_array, :available_moves, :game_over
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
      raise StandardError.new "\nInvalid choice, try again!"

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
    return false if available_moves.positive?

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

class Game
  attr_accessor :player_one_name, :player_one_input, :player_two_name, :player_two_input, :board
  attr_accessor :user_one_choice, :user_two_choice, :player_one, :player_two, :user_move

  def initialize
    puts 'Welcome to Tic-Tac-Toe'
    create_users
    self.board = Board.new
    play_game until board.game_over
  end

  def create_users
    print "\nPlayer 1, choose your name: "
    self.player_one_name = gets.chomp
    print "#{player_one_name}, choose your symbol: "
    self.player_one_input = gets.chomp

    print "\nPlayer 2, choose your name: "
    self.player_two_name = gets.chomp
    print "#{player_two_name}, choose your symbol: "
    self.player_two_input = gets.chomp

    self.player_one = Player.new(player_one_name, player_one_input)
    self.player_two = Player.new(player_two_name, player_two_input)
  end

  def play_game
    play_game_helper(player_one)
    play_game_helper(player_two)
  end

  def play_game_helper(player)
    begin
      print "\nEnter your move, #{player.name}: "
      self.user_move = gets.chomp.to_i
      board.place_move(user_move, player)
    rescue StandardError => e
      puts e
      retry
    end
  end

end

Game.new
