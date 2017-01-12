class Exam
  attr_reader :title, :due_date
  attr_writer :assigned_to
  attr_accessor :grade
  def initialize(title, due_date)
    @title = title
    @due_date = due_date
    @assigned_to = nil
    @grade = nil
  end
end

class Rectangle
  attr_reader :length, :width
  attr_accessor :x, :y
  def initialize(length, width, x = 0, y = 0)
    @length = length
    @width = width
    @x = x
    @y = y
  end
  def area
  length * width
  end
  def location(x, y)
    @x = 0
    @y = 0
  end
  def diagonal
    Math.sqrt(length * length + width * width)
  end
  def move_right
    @x += 1
  end
  def move_up
    @y += 1
  end
  def move_left
     @x = move_right - 2
  end
  def move_down
    @y = move_up - 2
  end
end
