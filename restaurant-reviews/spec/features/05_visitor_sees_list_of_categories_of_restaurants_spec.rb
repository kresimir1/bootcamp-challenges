require 'rails_helper'

# [] Visiting the `/restaurants` path should have a link to categories.
# [] Visiting the `/categories/` path should show a list of all available category names

feature "As a user I want to see categories of restaurants
  So that I can see the different kinds of foods I could eat" do
  scenario "user sees a list categories" do
    Category.create(name: "Thai")
    Category.create(name: "Italian")
    Category.create(name: "Chinese")
    Category.create(name: "Russian")
    Category.create(name: "Fine dining")

    visit restaurants_path
    expect(page).to have_link "Categories"

    click_link "Categories"

    expect(page.current_path).to eq('/categories')
    expect(page).to have_content "Thai"
    expect(page).to have_content "Italian"
    expect(page).to have_content "Chinese"
    expect(page).to have_content "Russian"
    expect(page).to have_content "Fine dining"
  end
end
