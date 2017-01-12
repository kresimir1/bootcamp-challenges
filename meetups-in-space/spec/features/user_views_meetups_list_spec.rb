require 'spec_helper'

feature "user views list of meetups" do
  scenario "view list of meetups in alphabetichal order" do
    # First create some sample meetups
    meetup_1 = Meetup.create!({
        name: "A Meetup", creator: "Kresimir",
        location: "Starbucks", description: "Very good for a first meetup"
      })

      meetup_2 = Meetup.create!({
          name: "B Meetup", creator: "Not_kresimir",
          location: "Still Starbucks", description: "I expected more of the second meetup"
        })

    # The user visits the index page
    visit "/meetups"

    # And should see both meetups listed (just the title and network)
    expect(page).to have_content("A Meetup")
    expect(page).to have_content("B Meetup")
    # The names of the meetups should be in alphabetichal order
    page.body.index("A Meetup").should < page.body.index("B Meetup")

  end
end
