require_relative 'dwelling'
require_relative 'occupant'

module Chillow

  def full?
    if @currently_occupied.size >= @max_capacity
      true
    else
      false
    end
  end

  def add_one(first_name, last_name)
    @currently_occupied << Occupant.new(first_name, last_name)
  end

  def remove_one(first, last)
    @currently_occupied.each_with_index do |person, index|
      if person.first_name == first && person.last_name == last
        @currently_occupied.delete_at(index)
      end
    end
  end
end
