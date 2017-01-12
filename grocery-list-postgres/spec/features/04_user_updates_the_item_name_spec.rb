require "spec_helper"

feature "user updates the item name" do
  scenario "successfully updates grocery item name" do
    visit "/groceries"
    fill_in "Name", with: "Peanut Butter"
    click_button "Submit"
    expect(page).to have_content "Peanut Butter"

    click_link "Edit name"


    expect(page.current_path).to eq('/groceries/1/edit')


    fill_in "Rename your item:", with: "Smeanut Butter"
    click_button "Update"
    expect(page.current_path).to eq('/groceries')
    expect(page).to have_content "Smeanut Butter"

  end
  scenario "submit form without name" do
    visit "/groceries"
    fill_in "Name", with: "Peanut Butter"
    click_button "Submit"
    click_link "Edit name"


    fill_in "Rename your item:", with: ""
    click_button "Update"
    expect(page.current_path).to eq('/groceries/1/edit')
    expect(page).to have_content "Update item name:"
  end
end
