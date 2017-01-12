require 'spec_helper'

feature "user can view details of meetup" do
  scenario "each meetup on the index page should be a link to the
  page containing meetup details" do
    # First create a sample meetup
    meetup_1 = Meetup.create!({
        name: "A Meetup", creator: "Kresimir",
        location: "Starbucks", description: "Very good for a first meetup"
      })

    # The user visits the index page
    visit "/meetups"
    # user cliks on the meetup link
    click_link('A Meetup')
    # And should see the details listed

    expect(page).to have_content("A Meetup")
    expect(page).to have_content("Kresimir")
    expect(page).to have_content("Starbucks")

  end
end
