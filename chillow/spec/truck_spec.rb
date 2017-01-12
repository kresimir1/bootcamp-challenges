require 'spec_helper'

describe 'Truck' do
  let (:truck) {Truck.new(120, [])}

  it 'has a maximum number of boxes it can hold' do
    expect(truck.max_capacity).to eq(120)
  end
  it 'has an method that represents boxes in the truck' do

    expect(truck.currently_occupied).to eq([])
  end

  it 'box should have an owner info' do
    truck1 = Truck.new(120, [Box.new("John", "Doe")])
    expect((truck1.currently_occupied)[0].first_name).to eq("John")
  end

  describe "#full?" do

    it 'should return true if number of tenants has reached max_capacity' do
      truck2 = Truck.new(3, [1, 2, 3])
      expect(truck2.full?).to eq(true)
    end
    it 'should return false if number of tenants has not reached max_capacity' do
      truck1 = Truck.new(120, [Box.new("John", "Doe")])
      expect(truck1.full?).to eq(false)
    end
  end
  #
  describe "#add_one" do
    it 'should add a box to the truck currently_occupied' do
      truck.add_one("Donald", "Duck")
      expect(truck.currently_occupied.size).to eq(1)
    end
  end

  describe "#remove_one" do
    it 'should remove a box from the truck currently_occupied' do
      truck1 = Truck.new(120, [Box.new("John", "Doe")])
      truck1.remove_one("John", "Doe")
      expect(truck1.currently_occupied.size).to eq(0)
    end
  end


end
