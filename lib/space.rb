class Space
  attr_accessor :mark
  def initialize
    @mark = " "
  end

  def empty?
    @mark == " "
  end
end
