
def perimeter(width, height = nil)
  if height.nil?
    width * 4
  else
    width * 2 + height * 2
  end
end
