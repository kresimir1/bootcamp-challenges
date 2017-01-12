require "spec_helper"

feature "items on the list are links to the page containing item name and quantity" do
  scenario "once added an item on the list is a link that contains name and quantity" do
    visit "/groceries"

    fill_in "Name", with: "tomatoes"
    fill_in "Quantity", with: "3"
    click_on "Add"
    click_on "tomatoes (3)"
    expect(page).to have_content("Item")
    expect(page).to have_content("tomatoes (3)")
    expect(page.current_path).to eq('/groceries/tomatoes')
  end
end
