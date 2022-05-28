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

  def make_move(move, symbol)
    move_index = board_array.index(move)
    board_array[move_index] = symbol

    create_board
  end
end

class Player
  def initialize(symbol)
    @player_symbol = symbol
  end
end

new_board = Board.new
new_board.make_move(1, 'X')
