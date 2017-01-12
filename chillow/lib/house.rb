require_relative 'dwelling'

class House < Dwelling
  attr_reader :asking_price
  def initialize(adress, city, state, zip_code, asking_price)
    super(adress, city, state, zip_code)
    @asking_price = asking_price
  end

end
