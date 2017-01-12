require "rails_helper"

# Acceptance Criteria:
#
# I must specify a manufacturer name and country.
# If I do not specify the required information, I am presented with errors.
# If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers

feature "user can add manufacturer" do
  scenario "user adds new manufacturer successfully" do

    visit new_manufacturer_path
    expect(page).to have_content "New Manufacturer Form"

    fill_in 'Name', with: "Honda"
    fill_in 'Country', with: "Japan"
    click_button "Add Manufacturer"

    expect(page.current_path).to eq(manufacturers_path)
    expect(page).to have_content "Manufacturer added successfully"
    expect(page).to have_content "Honda"
    expect(page).to have_content "Japan"
  end

  scenario "user does not provide proper information for a manufactorer" do
    visit new_manufacturer_path

    click_button "Add Manufacturer"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Country can't be blank"

  end
end
