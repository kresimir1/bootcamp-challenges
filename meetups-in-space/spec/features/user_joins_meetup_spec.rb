require 'spec_helper'

feature "user can see a list of members of a meetup and join a meetup" do
  let(:user1) do
    User.create(
    provider: "github",
    uid: "1",
    username: "jarlax1",
    email: "jarlax1@launchacademy.com",
    avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  scenario "When we get to the page with meetup details there should be a button
  that adds us to the members list to join the meetup" do

    meetup_1 = Meetup.create!({
        name: "A Meetup", creator: "Kresimir",
        location: "Starbucks", description: "Very good for a first meetup"
      })

    # The user visits the index page
    visit "/meetups"
    sign_in_as user1
    # user cliks on the meetup link
    click_link('A Meetup')
    # And should see the details listed
    click_button('Join Meetup')
    # save_and_open_page

    expect(page).to have_content("Members:")
    expect(page).to have_content("jarlax1", count: 2)
    expect(page).to have_content("You have succesfully joined the meetup")
    expect(page).to have_css('#picture')
    expect(page).to have_xpath("//img[@src='#{user1[:avatar_url]}']")

  end

  scenario "If you try to join the meetup you are already a member of you
  should get a notification you are alrady joined" do

    meetup_1 = Meetup.create!({
        name: "A Meetup", creator: "Kresimir",
        location: "Starbucks", description: "Very good for a first meetup"
      })

    # The user visits the index page
    visit "/meetups"
    sign_in_as user1
    # user cliks on the meetup link
    click_link('A Meetup')
    # And should see the details listed
    click_button('Join Meetup')
    click_button('Join Meetup')

    expect(page).to have_content("You are already a member of this meetup!")

  end

  scenario "If you try to join the meetup while not signed in you
  should get a notification that you need to sign in" do

    meetup_1 = Meetup.create!({
        name: "A Meetup", creator: "Kresimir",
        location: "Starbucks", description: "Very good for a first meetup"
      })

    # The user visits the index page
    visit "/meetups"
    # user cliks on the meetup link
    click_link('A Meetup')
    # And should see the details listed
    click_button('Join Meetup')

    expect(page).to have_content("You must sign in to join this meetup")

  end

end
