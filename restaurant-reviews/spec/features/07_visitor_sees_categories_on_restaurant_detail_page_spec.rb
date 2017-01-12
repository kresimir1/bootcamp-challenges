require 'rails_helper'

# On the page for a restaurant's details, I should see all the categories that a restaurant belongs to.
# Clicking on the name of a category should take me to the page with the list of all the restaurants for that particular category.


feature "As a user I want to see the categories that a restaurant belongs to
  So that I know the different kinds of cuisine that the restaurant serves" do
  scenario "user sees restaurant categories on the restaurant details page" do
    category1 = Category.create(name: "Thai")
    category2 = Category.create(name: "Italian")
    restaurant1 = Restaurant.create(name: 'Restaurant 1', address: 'Adress 1', city: 'City 1', state: 'State 1', zip: '20904')
    restaurant2 = Restaurant.create(name: 'Restaurant 2', address: 'Adress 1', city: 'City 1', state: 'State 1', zip: '20904')
    RestaurantCategory.create(restaurant_id: restaurant1.id, category_id: category1.id)
    RestaurantCategory.create(restaurant_id: restaurant1.id, category_id: category2.id)
    RestaurantCategory.create(restaurant_id: restaurant2.id, category_id: category1.id)
    RestaurantCategory.create(restaurant_id: restaurant2.id, category_id: category2.id)

    visit restaurants_path
    click_link restaurant1.name

    expect(page).to have_content(restaurant1.name)
    expect(page).to have_content(restaurant1.address)
    expect(page).to have_content(restaurant1.city)
    expect(page).to have_content(restaurant1.state)

    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)
    expect(page).not_to have_content(restaurant2.name)

    # Clicking on the name of a category should take me to the page with the list of all the restaurants for that particular category.
    click_link category1.name
    expect(page).to have_content(restaurant1.name)
    expect(page).to have_content(restaurant2.name)

  end
end
