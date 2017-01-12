class BoundingBox
  attr_accessor :x, :y, :width, :height
  def initialize(x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
  end

  def left
    left = @x
  end

  def right
    @x + @width
  end

  def bottom
    @y
  end

  def top
    @y + @height
  end

  def contains_point?(x_point, y_point)
    if x_point >= @x && x_point <= (@x + @width) && y_point >= @y && y_point <= (@y + @height)
      true
    else
      false
    end
  end
end
