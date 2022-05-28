class Board
  def initialize
    @board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    create_board
  end

  attr_accessor :board_array

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

  public # change to protected later

  def place_move(move, player)
    move_index = board_array.index(move)

    if move_index.nil?
      puts 'Invalid choice, try again!'

    else
      board_array[move_index] = player.player_symbol
      if winner?(player)
        puts "#{player.name} WON"
      end
    end

    create_board
  end

  def winner?(player)
    if board_array[0..2].all? { |number| number == player.player_symbol } || board_array[3..5].all? { |number| number == player.player_symbol } || board_array[6..8].all? { |number| number == player.player_symbol }
      true
    else
      false
    end
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
  puts "\nEnter a choice: "
  user_choice = gets.chomp.to_i
  new_board.place_move(user_choice, player)
end
