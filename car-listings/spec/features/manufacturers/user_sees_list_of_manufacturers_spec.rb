require 'rails_helper'

# [] Visiting the `/manufacturers` path should contain a list of manufacturers.
# [] You should see the name and the country of manufacturer.

feature "user sees a list of cars" do
  scenario "sees a list of cars and link for new restaurant" do
    manufacturer1 = Manufacturer.create(name: "Honda", country: "Japan")
    manufacturer2 = Manufacturer.create(name: "Audi", country: "Germany")


    visit manufacturers_path
    expect(page).to have_content "Available Manufacturers"
    expect(page).to have_content "Honda"
    expect(page).to have_content "Audi"
    expect(page).to have_content "Japan"
    expect(page).to have_content "Germany"


  end
end
