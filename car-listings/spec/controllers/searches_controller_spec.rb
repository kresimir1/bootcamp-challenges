require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe "@colors, @manufacturers, @years" do
    it "should be a lists of options with uniq values(years ordered - newest first)" do
      manufacturer1 = Manufacturer.create(name: "Honda", country: "Japan")
      manufacturer2 = Manufacturer.create(name: "Audi", country: "Germany")
      car1 = Car.create(model: 'Model1', manufacturer_id: manufacturer1.id, color: 'red', year: '1995', milage: '99000')
      car2 = Car.create(model: 'Model2', manufacturer_id: manufacturer2.id, color: 'blue', year: '1996', milage: '99000')
      car3 = Car.create(model: 'Model3', manufacturer_id: manufacturer1.id, color: 'yellow', year: '1995', milage: '99000')
      car4 = Car.create(model: 'Model4', manufacturer_id: manufacturer1.id, color: 'red', year: '2003', milage: '99000')
      car5 = Car.create(model: 'Model5', manufacturer_id: manufacturer1.id, color: 'red', year: '1995', milage: '101000')
      # @colors = Car.distinct.pluck(:color)
      get :new

      assigns(:colors).should eq(["yellow", "blue", "red"])
      assigns(:years).should eq([2003, 1996, 1995])
      assigns(:manufacturers).should eq(["Honda", "Audi"])
    end
  end
end
