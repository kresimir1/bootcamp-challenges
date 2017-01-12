require "spec_helper"

feature "user adds item quantity" do
  scenario "quantity added when filled form submitted" do
    visit "/groceries"

    fill_in "Name", with: "tomatoes"
    fill_in "Quantity", with: "3"
    click_on "Add"

    expect(page).to have_content("tomatoes (3)")
  end

  scenario "empty li element is not added when form missing name is submitted" do
    visit "/groceries"
    click_on "Add"

    expect(page).not_to have_selector("li")
  end
  #quantity optional
  scenario "if the item is added without quantity it should still be added " do
    visit "/groceries"

    fill_in "Name", with: "tomatoes"
    click_on "Add"

    expect(page).to have_content("tomatoes ()")
  end

  scenario "if the quantity is added without item name the quantity stay entered
  and the message to ask to submit name should appear " do
    visit "/groceries"

    fill_in "Quantity", with: "345"
    click_on "Add"

    expect(page).to have_content("Please enter the name of the grocery")

    fill_in "Name", with: "tomatoes"
    click_on "Add"

    expect(page).to have_content("345")
  end



end
