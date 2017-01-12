require 'rails_helper'

# On the page to create a new restaurant, I should see checkboxes for all the categories.
# Upon successful form submission, I should see the names of the categories which were
# selected on the form to be present on the restaurant's details page.


feature "As a user I want to specify what categories a restaurant belongs to when creating it
  So people know what kind of cuisine the new restaurant serves" do
  scenario "user adds new restaurant with the category and sees it on the restaurant detail page" do

    category1 = Category.create(name: "Italian")
    category2 = Category.create(name: "Peruvian")
    visit new_restaurant_path
    expect(page).to have_content "New Restaurant Form"

    fill_in 'Name', with: "Figaro's"
    fill_in 'Address', with: "105 Beach St"
    fill_in 'City', with: "Boston"
    fill_in 'State', with: "Massachusetts"
    fill_in 'Zip', with: "02111"
    fill_in 'Description', with: "This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads."
    first('.category').click
    click_button "Add Restaurant"


    expect(page).to have_content "Restaurant added successfully"
    expect(page).to have_content "Figaro's"
    expect(page).to have_content "This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads."
    expect(page).to have_content(category1.name)
    expect(page).not_to have_content(category2.name)
  end
end
