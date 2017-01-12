class Circle
  attr_reader :r, :x, :y
  def initialize(r, x = 0, y = 0)
    @r = r
    @x = x
    @y = y
  end

  def radius
    @r
  end

  def diameter
    2 * @r
  end

  def area
    (@r**2)*(Math::PI)
  end

  def perimeter
    2 * @r * Math::PI
  end

end
