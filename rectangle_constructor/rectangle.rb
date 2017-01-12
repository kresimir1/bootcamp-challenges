class Rectangle
  attr_reader :width, :height


  def initialize(width, height = nil)
    @width = width
    if height.nil?
      @height = width
    else
    @height = height
    end
  end
  def rectangle_area
    @area = width * height
  end
end

rectangle = Rectangle.new(2, 3)
puts rectangle.rectangle_area
