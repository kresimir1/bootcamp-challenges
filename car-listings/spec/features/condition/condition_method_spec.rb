require 'rails_helper'

# Implement a method on the car class that returns the condition of a vehicle, based on the age and mileage. It is up to you to determine how to implement this method, but it should return the condition listed for these sample inputs for year and mileage. The method must have a corresponding unit test.
# Once this method is working correctly, make sure you display the condition of the car on the car index page.
require 'rails_helper'

RSpec.describe Car do
  describe "condition(year, milage) method" do
  it "checks for a condition of the car depending on the milage and year" do
    manufacturer = Manufacturer.new(name: "Honda", country: "Japan")
    car1 = Car.create(model: 'Model1', manufacturer_id: manufacturer.id, color: 'red', year: '2016', milage: '900')
    car2 = Car.create(model: 'Model2', manufacturer_id: manufacturer.id, color: 'red', year: '2016', milage: '1000')
    car3 = Car.create(model: 'Model3', manufacturer_id: manufacturer.id, color: 'yellow', year: '2015', milage: '900')
    car4 = Car.create(model: 'Model4', manufacturer_id: manufacturer.id, color: 'red', year: '2015', milage: '50000')
    car5 = Car.create(model: 'Model5', manufacturer_id: manufacturer.id, color: 'red', year: '2011', milage: '900')
    car6 = Car.create(model: 'Model6', manufacturer_id: manufacturer.id, color: 'red', year: '2011', milage: '50000')

    expect(car1.condition(car1.year, car1.milage)).to eq("Excellent")
    expect(car2.condition(car2.year, car2.milage)).to eq("Good")
    expect(car3.condition(car3.year, car3.milage)).to eq("Good")
    expect(car4.condition(car4.year, car4.milage)).to eq("Fair")
    expect(car5.condition(car5.year, car5.milage)).to eq("Fair")
    expect(car6.condition(car6.year, car6.milage)).to eq("Poor")

    end
  end
end
#
# require_relative "../code"
#
# describe "caesar_cipher(string, number)" do
#   it "it takes a string and a number as an argument and returns a string based
#   that has all the characters shifted for the number spaces in alphabet" do
#     string1 = "a"
#     string2 = "z"
#     string3 = "Caesar"
#     string4 = "Caesar [-+======]"
#     number = 2
#     expect(caesar_cipher(string1, number)).to eq("c")
#     expect(caesar_cipher(string2, number)).to eq("b")
#     expect(caesar_cipher(string3, number)).to eq("Ecguct")
#     expect(caesar_cipher(string4, number)).to eq("Ecguct [-+======]")
#   end
# end
