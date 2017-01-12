require 'rails_helper'

# [] Visiting the `/cars` path should contain a list of cars.
# [] Visiting the `/cars/10` path should show the car details for a car with the ID of 10.
# [] Visiting the root path should display a list of all cars.

feature "user sees a list of cars" do
  scenario "sees a list of cars and link for new car" do
    manufacturer1 = Manufacturer.create(name: "Honda", country: "Japan")
    manufacturer2 = Manufacturer.create(name: "Audi", country: "Germany")
    car1 = Car.create(model: 'Model1', manufacturer_id: manufacturer1.id, color: 'red', year: '1995', milage: '350000', description: 'Description 1')
    car2 = Car.create(model: 'Model2', manufacturer_id: manufacturer2.id, color: 'blue', year: '2003', milage: '210000', description: 'Description 2')

    visit cars_path
    expect(page).to have_content car1.model
    expect(page).to have_link car2.model
    expect(page).to have_content car1.year
    expect(page).to have_content car2.year
    expect(page).to have_link ("Add New Car")

  end
  scenario "clicks link and is taken to show page for given car" do
    manufacturer = Manufacturer.create(name: "Honda", country: "Japan")
    car = Car.create(model: 'Honda Civic', manufacturer_id: manufacturer.id, color: 'red', year: '1995', milage: '335000', description: "good car")

    visit root_path

    click_link "Honda Civic"

    expect(page).to have_content car.model
    expect(page).to have_content manufacturer.name
    expect(page).to have_content car.color
    expect(page).to have_content car.year
    expect(page).to have_content car.milage
    expect(page).to have_content car.description
  end
end
