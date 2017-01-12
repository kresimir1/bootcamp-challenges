require 'rails_helper'

# I should see the name of the category at the top of the page.
# I should see the name of all restaurants that belong to this category.
# I should be taken to restaurant's details page if I click on the name of a restaurant while on this page.
# I should get to this page by clicking on the name of a category while on the page with the names of all the categories.""

feature "As a user I want to see the restaurants belonging to a category
  So that I can pick a restaurant for a specific category" do
  scenario "user sees a list of restaurants under the category" do
    category = Category.create(name: "Thai")
    restaurant1 = Restaurant.create(name: 'Restaurant 1', address: 'Adress 1', city: 'City 1', state: 'State 1', zip: '20904')
    restaurant2 = Restaurant.create(name: 'Restaurant 2', address: 'Adress 1', city: 'City 1', state: 'State 1', zip: '20904')
    RestaurantCategory.create(restaurant_id: restaurant1.id, category_id: category.id)
    RestaurantCategory.create(restaurant_id: restaurant2.id, category_id: category.id)


    visit restaurants_path
    expect(page).to have_link "Categories"
    click_link "Categories"

    expect(page).to have_link "Thai"
    click_link "Thai"
  

    expect(page).to have_content("Thai")
    expect(page).to have_content(restaurant1.name)
    expect(page).to have_content(restaurant2.name)

    click_link (restaurant1.name)
    expect(page).to have_content(restaurant1.name)
    expect(page).to have_content(restaurant1.address)
    expect(page).to have_content(restaurant1.city)
    expect(page).to have_content(restaurant1.state)

    expect(page).not_to have_content(restaurant2.name)


  end
end
