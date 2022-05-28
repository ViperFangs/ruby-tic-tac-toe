class Board

  def initialize

    @BOARD_SIZE = 3
    @board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    self.create_board
  end

  attr_accessor :board_array

  private

  def create_line
    puts "---+---+---"
  end

  def create_board
    self.board_array.each_with_index do |current_value, index|

      if index == 2 || index == 5 || index == 8
        puts" #{current_value}"
        create_line
      
      else
        print " #{current_value} |"
      end

    end

  end

end

new_board = Board.new