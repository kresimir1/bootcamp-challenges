require 'spec_helper'

describe Apartment do
  let (:tenants_full) {[Occupant.new("Jane", "Doe"),
  Occupant.new("John", "Johnson"),Occupant.new("Jack", "White")]}
  let (:info) {Apartment.new("New Columbia", "Rockville", "MD", 20905, 1000,
     [6, 14, 2016], [10, 10, 2017], 3, tenants_full)}
  it 'has an adress' do
    expect(info.adress).to eq("New Columbia")
  end
  it 'has a city/town' do
    expect(info.city).to eq("Rockville")
  end
  it 'has a state' do
    expect(info.state).to eq("MD")
  end
  it 'has a zip code' do
    expect(info.zip_code).to eq(20905)
  end
  it 'has an rent per month' do
    expect(info.rent).to eq(1000)
  end
  it 'has a lease start date' do
    expect(info.start_date).to eq([6, 14, 2016])
  end
  it 'has a lease end date' do
    expect(info.end_date).to eq([10, 10, 2017])
  end
  describe "#full?" do
    it 'should have a maximum capacity' do
      expect(info.max_capacity).to eq(3)
    end
    it 'should have a tenants' do
      expect(info.currently_occupied).to eq(tenants_full)
    end
    it 'should return true if number of tenants has reached max_capacity' do
      expect(info.full?).to eq(true)
    end
    it 'should return false if number of tenants has not reached max_capacity' do
      info1 = Apartment.new("New Columbia", "Rockville", "MD", 20905, 1000,
         [6, 14, 2016], [10, 10, 2017], 3, [Occupant.new("Jane", "Doe")])
      expect(info1.full?).to eq(false)
    end
  end

  describe "#add_roomate" do
    it 'should add a roomate to tenants' do
      info.add_one("Donald", "Duck")
      expect(info.currently_occupied.size).to eq(4)
    end
  end

  describe "#remove_roomate" do
    it 'should remove a roomate from tenants' do
      info.remove_one("Jack", "White")
      expect(info.currently_occupied.size).to eq(2)
    end
  end

end
