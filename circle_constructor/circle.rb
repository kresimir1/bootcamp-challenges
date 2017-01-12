# part 1
# class Circle
#   attr_reader :radius
#
#   def initialize(radius)
#     @radius = radius
#   end
# end

# part 2
# class Circle
#   attr_reader :radius
#
#   def initialize(input)
#     if input[:radius].nil?
#       @radius = input[:diameter]/2
#     else
#       @radius = input[:radius]
#     end
#   end
# end

# part 3
class Circle
  attr_reader :radius

  def initialize(options_or_radius)
    if options_or_radius.kind_of?(Hash)
      @radius = options_or_radius[:radius] || (options_or_radius[:diameter] / 2)
    else
      @radius = options_or_radius
    end
  end
end
