class Grid
  attr_reader(:board)

  def initialize
    @board = []
    9.times {@board << Space.new}
  end

  def winner?(symbol)

    (0..2).each do |index|
      if @board[get_index(0, index)].mark == symbol &&
         @board[get_index(1, index)].mark == symbol &&
         @board[get_index(2, index)].mark == symbol
         return true
      end
      if @board[get_index(index, 0)].mark == symbol &&
         @board[get_index(index, 1)].mark == symbol &&
         @board[get_index(index, 2)].mark == symbol
         return true
      end
      if @board[get_index(1, 1)].mark == symbol
        return true if  @board[get_index(0, 0)].mark == symbol &&
                        @board[get_index(2, 2)].mark == symbol
        return true if  @board[get_index(2, 0)].mark == symbol &&
                        @board[get_index(0, 2)].mark == symbol
      end

    end

    false
  end

  def mark_space(x, y, sym)
    @board[get_index(x, y)].mark = sym
  end

  def get_index(x, y)
    y * 3 + x
  end
end


