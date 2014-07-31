require 'rspec'
require 'grid'
require 'space'
require 'player'
require 'game'

describe 'Grid' do
  describe "initialize" do
    it 'creates a game board' do
      test_grid = Grid.new
      test_grid.should be_an_instance_of Grid
    end
  end

  describe "board" do
    it 'initializes the game board' do
      Grid.new.board.length.should eq 9
    end

    it 'initializes with blank spaces' do
      Grid.new.board.each {|space| space.mark.should eq ' '}
    end
  end

  describe "mark_space" do
    it 'assigns a symbol to an x-y coordinate' do
      test_grid = Grid.new
      test_grid.mark_space(0, 1, "X")
      test_grid.board[3].mark.should eq "X"
    end
  end

  describe "winner?" do
    it 'returns false if there are not three consecutive occurences of a given character' do
      Grid.new.winner?("X").should eq false
    end

    it 'returns true if there is a horizontal tic-tac-toe' do
      test_grid = Grid.new
      test_grid.mark_space(0, 0, "O")
      test_grid.mark_space(1, 0, "O")
      test_grid.mark_space(2, 0, "O")
      test_grid.mark_space(0, 2, "X")
      test_grid.mark_space(1, 2, "X")
      test_grid.mark_space(2, 2, "X")
      test_grid.winner?("O").should eq true
      test_grid.winner?("X").should eq true
    end

    it 'returns true if there is a vertical tic-tac-toe' do
      test_grid = Grid.new
      test_grid.mark_space(2, 0, "X")
      test_grid.mark_space(2, 1, "X")
      test_grid.mark_space(2, 2, "X")
      test_grid.mark_space(0, 0, "O")
      test_grid.mark_space(0, 1, "O")
      test_grid.mark_space(0, 2, "O")
      test_grid.winner?("X").should eq true
      test_grid.winner?("O").should eq true
    end

    it 'returns true if there is a diagonal tic-tac-toe' do
      test_grid = Grid.new
      test_grid.mark_space(0, 0, "X")
      test_grid.mark_space(1, 1, "X")
      test_grid.mark_space(2, 2, "X")
      test_grid.winner?("X").should eq true
      test_grid.winner?("O").should eq false
    end
  end
end

describe 'Space' do
  describe "initialize" do
    it 'creates a space' do
      test_space = Space.new
      test_space.should be_an_instance_of Space
    end

    it 'initializes with the ability to be marked' do
      test_space = Space.new
      test_space.mark = "X"
      test_space.mark.should eq "X"
    end
  end

  describe "empty?" do
    it "returns true if the space is empty" do
      Space.new.empty?.should eq true
    end

    it "returns false if the space is taken" do
      test_space = Space.new
      test_space.mark = "X"
      test_space.empty?.should eq false
    end
  end
end

describe "Player" do
  describe "initialize" do
    it 'creates a new player' do
      test_player = Player.new("JJ", "X")
      test_player.should be_an_instance_of Player
    end

    it 'initializes a player with a symbol' do
      test_player = Player.new("Justin", "G")
      test_player.symbol.should eq "G"
    end
  end
end

describe "Game" do
  describe "initialize" do
    it 'initializes with two players' do
      test_game = Game.new(Player.new("JJ", "X"), Player.new("Justin", "O"))
      test_game.players.length.should eq 2
    end
  end

  describe "turn" do
    it 'accesses the current turn' do
      test_game = Game.new(Player.new("JJ", "X"), Player.new("Justin", "O"))
      test_game.turn.should eq 0
    end
  end

  describe "take_turn" do
    it 'alternates turns' do
      test_game = Game.new(Player.new("JJ", "X"), Player.new("Justin", "O"))
      test_game.take_turn(0, 0)
      test_game.turn.should eq 1
    end

    it 'marks a space at x,y on the grid' do
      test_game = Game.new(Player.new("JJ", "X"), Player.new("Justin", "O"))
      test_game.take_turn(0, 0)
      test_game.grid.board[0].mark.should eq 'X'
      test_game.take_turn(1, 1)
      test_game.grid.board[4].mark.should eq 'O'
    end
  end
end













