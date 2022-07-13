class Player
  attr_reader :player_symbol, :name

  def initialize(name, symbol)
    @name = name
    @player_symbol = symbol
  end
end
