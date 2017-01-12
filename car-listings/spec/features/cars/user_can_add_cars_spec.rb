require "rails_helper"

# I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
# Only years from 1920 and above can be specified.
# I can optionally specify a description of the car.
# If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
# If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# Upon successfully creating a car, I am redirected back to the index of cars.

feature "user can add cars" do
  scenario "user adds new car successfully" do
    manufacturer1 = Manufacturer.create(name: "Honda", country: "Japan")
    manufacturer2 = Manufacturer.create(name: "Audi", country: "Germany")


    visit new_car_path
    expect(page).to have_content "New Car Form"

    fill_in 'Model', with: "Honda Civic"
    select 'Honda', from: "Manufacturer"
    fill_in 'Color', with: "Red"
    fill_in 'Year', with: "1995"
    fill_in 'Milage', with: "35456"
    fill_in 'Description', with: "exceptional styling cues, a powerful engine,"
    click_button "Add Car"

    expect(page.current_path).to eq(cars_path)
    expect(page).to have_content "Car added successfully"
    expect(page).to have_content "Honda Civic"
    expect(page).to have_content "1995"
  end

  scenario "user does not provide proper information for a car" do
    visit new_car_path

    click_button "Add Car"
    expect(page).to have_content "Model can't be blank"
    expect(page).to have_content "Color can't be blank"
    expect(page).to have_content "Year can't be blank"
    expect(page).to have_content "Manufacturer can't be blank"
    expect(page).to have_content "Milage can't be blank"

    fill_in 'Year', with: "1910"
    expect(page).to have_content "Year can't be under 1920"
  end
end
