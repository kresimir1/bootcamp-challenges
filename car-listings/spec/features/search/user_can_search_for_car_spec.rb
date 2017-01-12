require 'rails_helper'

# There is a search form for cars on the cars index.
# I can specify the manufacturer, color, year, and a max mileage of a car in the form.
# The manufacturers that can be selected should be the ones shown on the manufacturer index page.
# There should be a dropdown with the colors of all the cars. There should be no duplicate color options. If a new car with a new color is added via the form, the dropdown should update to include the color.
# There should be a dropdown with the years of all the cars. There should be no duplicate year options and they should be ordered form most newest to oldest. If a new car with a new year is added via the form, the dropdown should update to include the year.
# There should be a dropdown with the max mileages of the cars. The options should be 'N/A', '1000', '10,000', '100,000'. Selecting 'N/A' should not take mileage into account. Selecting a mileage should filter for cars with mileage less than or equal to the selected mileage.
# If I submit the form without specifying anything, I should see the full car index.
# If I submit the form with certain specifications, I should only see cars that fit those specifications.


feature "As a car buyer I want to search for specific cars
  So that I can look at the cars that I am interested in" do
  scenario "do a simple keyword search on the car index page" do
    manufacturer1 = Manufacturer.create(name: "Honda", country: "Japan")
    manufacturer2 = Manufacturer.create(name: "Audi", country: "Germany")
    car1 = Car.create(model: 'Model1', manufacturer_id: manufacturer1.id, color: 'red', year: '1995', milage: '350000', description: 'Description 1')
    car2 = Car.create(model: 'Model2', manufacturer_id: manufacturer2.id, color: 'blue', year: '2003', milage: '210000', description: 'Description 2')

    visit cars_path
    fill_in (:search), with: 'Model1'

    click_button "Search"

    expect(page).to have_content car1.model
    expect(page).not_to have_content car2.model
    expect(page).to have_content car1.year
    expect(page).not_to have_content car2.year
  end

  scenario "do a advanced search for the specific car" do
    manufacturer1 = Manufacturer.create(name: "Honda", country: "Japan")
    manufacturer2 = Manufacturer.create(name: "Audi", country: "Germany")
    car1 = Car.create(model: 'Model1', manufacturer_id: manufacturer1.id, color: 'red', year: '1995', milage: '99000')
    car2 = Car.create(model: 'Model2', manufacturer_id: manufacturer2.id, color: 'red', year: '1995', milage: '99000')
    car3 = Car.create(model: 'Model3', manufacturer_id: manufacturer1.id, color: 'yellow', year: '1995', milage: '99000')
    car4 = Car.create(model: 'Model4', manufacturer_id: manufacturer1.id, color: 'red', year: '2003', milage: '99000')
    car5 = Car.create(model: 'Model5', manufacturer_id: manufacturer1.id, color: 'red', year: '1995', milage: '101000')
    visit cars_path
    click_link 'Advanced Search'

    select 'Honda', from: "Manufacturer name"
    select 'red', from: "Color"
    select '1995', from: "Year"
    select '100000', from: "Max milage"
    click_button "Search"

    expect(page).to have_content car1.model

    #expect not to find car2 because of different manufacturer
    expect(page).not_to have_content car2.model

    #expect not to find car3 because of different color
    expect(page).not_to have_content car3.model

    #expect not to find car4 because of different year
    expect(page).not_to have_content car4.model

    #expect not to find car5 because the max milage is over 100.000
    expect(page).not_to have_content car5.model
  end

  scenario "when submitting an empty form I should see all the cars" do
    manufacturer1 = Manufacturer.create(name: "Honda", country: "Japan")
    manufacturer2 = Manufacturer.create(name: "Audi", country: "Germany")
    car1 = Car.create(model: 'Model1', manufacturer_id: manufacturer1.id, color: 'red', year: '1995', milage: '99000')
    car2 = Car.create(model: 'Model2', manufacturer_id: manufacturer2.id, color: 'red', year: '1995', milage: '99000')
    car3 = Car.create(model: 'Model3', manufacturer_id: manufacturer1.id, color: 'yellow', year: '1995', milage: '99000')
    car4 = Car.create(model: 'Model4', manufacturer_id: manufacturer1.id, color: 'red', year: '2003', milage: '99000')
    car5 = Car.create(model: 'Model5', manufacturer_id: manufacturer1.id, color: 'red', year: '1995', milage: '101000')

    visit cars_path
    click_link 'Advanced Search'
    click_button "Search"

    expect(page).to have_content car1.model
    expect(page).to have_content car2.model
    expect(page).to have_content car3.model
    expect(page).to have_content car4.model
    expect(page).to have_content car5.model
  end

  scenario "when selecting 'N/A' in the max_milage I should see all the cars" do
    manufacturer1 = Manufacturer.create(name: "Honda", country: "Japan")
    manufacturer2 = Manufacturer.create(name: "Audi", country: "Germany")
    car1 = Car.create(model: 'Model1', manufacturer_id: manufacturer1.id, color: 'red', year: '1995', milage: '99000')
    car2 = Car.create(model: 'Model2', manufacturer_id: manufacturer2.id, color: 'red', year: '1995', milage: '99000')
    car3 = Car.create(model: 'Model3', manufacturer_id: manufacturer1.id, color: 'yellow', year: '1995', milage: '99000')
    car4 = Car.create(model: 'Model4', manufacturer_id: manufacturer1.id, color: 'red', year: '2003', milage: '99000')
    car5 = Car.create(model: 'Model5', manufacturer_id: manufacturer1.id, color: 'red', year: '1995', milage: '101000')

    visit cars_path
    click_link 'Advanced Search'
    select 'N/A', from: "Max milage"
    click_button "Search"

    expect(page).to have_content car1.model
    expect(page).to have_content car2.model
    expect(page).to have_content car3.model
    expect(page).to have_content car4.model
    expect(page).to have_content car5.model
  end

# uniqness of the dropbox select optopns is tested in the searches_controller_spec.rb
end
