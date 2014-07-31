class Game
  attr_reader :players, :turn, :grid

  def initialize(player1, player2)
    @players = []
    @players << player1
    @players << player2
    @grid = Grid.new
    @turn = 0
  end

  def take_turn(x, y)
    @grid.mark_space(x, y, @players[turn].symbol)
    @turn ^= 1
  end
end
