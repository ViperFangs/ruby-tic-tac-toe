class Game
  attr_accessor :player_one_name, :player_one_symbol, :player_two_name, :player_two_symbol, :board, :user_one_choice,
                :user_two_choice, :player_one, :player_two, :user_move

  def initialize
    puts 'Welcome to Tic-Tac-Toe'
    create_users
    self.board = Board.new
    play_game until board.game_over
  end

  def create_users
    self.player_one_name = user_name('Player 1')
    self.player_one_symbol = select_symbol(player_one_name)

    self.player_two_name = user_name('Player 2')
    self.player_two_symbol = select_symbol(player_two_name)

    self.player_one = Player.new(player_one_name, player_one_symbol)
    self.player_two = Player.new(player_two_name, player_two_symbol)
    system('clear')
  end

  def user_name(player)
    print "\n#{player}, choose your name: "
    gets.chomp
  end

  def select_symbol(name)
    print "\n#{name}, choose your symbol: "
    gets.chomp
  end

  def play_game
    play_game_helper(player_one)
    play_game_helper(player_two)
  end

  def play_game_helper(player)
    print "\nEnter your move, #{player.name}: "
    self.user_move = gets.chomp.to_i
    system('clear')
    board.place_move(user_move, player)
  rescue StandardError => e
    puts e
    retry
  end
end
