class Game
  attr_accessor :player_one_name, :player_one_input, :player_two_name, :player_two_input, :board, :user_one_choice,
                :user_two_choice, :player_one, :player_two, :user_move

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
    system('clear')
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