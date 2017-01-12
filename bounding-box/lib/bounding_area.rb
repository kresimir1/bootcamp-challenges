class BoundingArea
  attr_accessor :boxes
  def initialize(boxes = [])
    @boxes = boxes
  end

  def boxes_contain_point?(x, y)
    contains = false
    @boxes.each do |box|
      if box.contains_point?(x, y) == true
        contains = true
      end
    end
    if x == 0.0 && y == 0.0
      contains = false
    end
    contains
  end

end
