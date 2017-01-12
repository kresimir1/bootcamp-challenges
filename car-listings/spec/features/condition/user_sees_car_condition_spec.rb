require 'rails_helper'

# Implement a method on the car class that returns the condition of a vehicle, based on the age and mileage. It is up to you to determine how to implement this method, but it should return the condition listed for these sample inputs for year and mileage. The method must have a corresponding unit test.
# Once this method is working correctly, make sure you display the condition of the car on the car index page.

feature "As a used car salesperson I would like to see the condition of a car
  So that I know how desirable it is to the buyer." do
  scenario "user sees a condition of the car on the page containing list of cars" do
    manufacturer = Manufacturer.create(name: "Honda", country: "Japan")
    car1 = Car.create(model: 'Model1', manufacturer_id: manufacturer.id, color: 'red', year: '2016', milage: '900')
    car2 = Car.create(model: 'Model2', manufacturer_id: manufacturer.id, color: 'red', year: '2016', milage: '1000')
    car3 = Car.create(model: 'Model3', manufacturer_id: manufacturer.id, color: 'yellow', year: '2015', milage: '900')
    car4 = Car.create(model: 'Model4', manufacturer_id: manufacturer.id, color: 'red', year: '2015', milage: '50000')
    car5 = Car.create(model: 'Model5', manufacturer_id: manufacturer.id, color: 'red', year: '2011', milage: '900')
    car6 = Car.create(model: 'Model6', manufacturer_id: manufacturer.id, color: 'red', year: '2011', milage: '50000')

    visit cars_path

    expect(page).to have_content ("Excellent")
    expect(page).to have_content ("Good"), count: 2
    expect(page).to have_content ("Fair"), count: 2
    expect(page).to have_content ("Poor")

  end

end
