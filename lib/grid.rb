class Grid
  attr_reader(:spaces)

  def initialize
    @spaces = []
    9.times {@spaces << Space.new}
  end

  def winner?(symbol)

    (0..2).each do |index|
      if @spaces[get_index(0, index)].mark == symbol &&
         @spaces[get_index(1, index)].mark == symbol &&
         @spaces[get_index(2, index)].mark == symbol
         return true
      end
      if @spaces[get_index(index, 0)].mark == symbol &&
         @spaces[get_index(index, 1)].mark == symbol &&
         @spaces[get_index(index, 2)].mark == symbol
         return true
      end
      if @spaces[get_index(1, 1)].mark == symbol
        return true if  @spaces[get_index(0, 0)].mark == symbol &&
                        @spaces[get_index(2, 2)].mark == symbol
        return true if  @spaces[get_index(2, 0)].mark == symbol &&
                        @spaces[get_index(0, 2)].mark == symbol
      end

    end

    false
  end

  def mark_space(x, y, sym)
    @spaces[get_index(x, y)].mark = sym
  end

  def get_index(x, y)
    y * 3 + x
  end

  def empty?(x, y)
    @spaces[get_index(x, y)].empty?
  end
end


