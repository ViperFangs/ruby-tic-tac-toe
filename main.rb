class Board

  def initialize
    @BOARD_SIZE = 3
    @board_array = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ]
    self.create_board
  end

  attr_accessor :BOARD_SIZE, :board_array

  private

  def create_line
    puts "---+---+---"
  end

  def create_board
    board_array.each_with_index do |row, row_index|

      puts row.to_s

      create_line
      
    end
  
  end

end

new_board = Board.new