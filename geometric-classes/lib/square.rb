class Square
  attr_reader :length, :x, :y
  def initialize(length, x = 0, y = 0)
    @length = length
    @x = x
    @y = y
  end

  def width
    @length
  end

  def diameter
    Math.sqrt((@length.to_f ** 2) * 2)
  end

  def perimeter
    4 * @length
  end

  def area
    @length ** 2
  end

  def contains_point?(x,y)
    if x >= @length || x < 0
      false
    elsif y >= @length || y < 0
      false
    else
      true
    end
  end
end
