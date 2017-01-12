require_relative 'dwelling'
require_relative 'chillow'

class Apartment < Dwelling
  include Chillow
  attr_reader :rent, :start_date, :end_date
  attr_reader :max_capacity, :currently_occupied
  def initialize(adress, city, state,
    zip_code, rent, start_date, end_date,
    max_capacity, currently_occupied)
    super(adress, city, state, zip_code)
    @rent = rent
    @start_date = start_date
    @end_date = end_date
    @max_capacity = max_capacity
    @currently_occupied = currently_occupied
  end
end
