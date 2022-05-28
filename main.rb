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
    board_array.each_with_index do |current_value, index|
      if [2, 5, 8].include?(index)
        puts " #{current_value}"
        create_line

      else
        print " #{current_value} |"
      end
    end
  end
end

new_board = Board.new
