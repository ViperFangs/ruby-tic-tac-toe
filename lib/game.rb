class Game
  attr_accessor :board, :player_one, :player_two, :user_move

  def initialize(player_one, player_two, board = Board.new)
    @player_one = player_one
    @player_two = player_two
    @board = board
  end

  def play_game
    return if board.game_over

    play_game_helper(player_one)
    play_game_helper(player_two)
    play_game
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
