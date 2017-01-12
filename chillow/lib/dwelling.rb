class Dwelling
  attr_reader :adress, :city, :state, :zip_code
  def initialize(adress, city, state, zip_code)
    @adress = adress
    @city = city
    @state = state
    @zip_code = zip_code
  end
end
