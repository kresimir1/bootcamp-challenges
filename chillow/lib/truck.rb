require_relative 'chillow'

class Truck
  include Chillow
  attr_reader :max_capacity, :currently_occupied
  def initialize(max_capacity, currently_occupied)
    @max_capacity = max_capacity
    @currently_occupied = currently_occupied
  end

end
