require 'spec_helper'

feature "user can create a new meetup" do
  let(:user) do
    User.create(
    provider: "github",
    uid: "1",
    username: "jarlax1",
    email: "jarlax1@launchacademy.com",
    avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  scenario "There should be a link from the meetups
  index page that takes you to the meetups new page with a form to create meetup" do

    visit "/"
    sign_in_as user
    # save_and_open_page
    # user cliks on the add new meetup link
    click_link('Add New Meetup')
    # # And should go to the /meetups/new page
    expect(page.current_path).to eq('/meetups/new')
    # #On this page there is a form to create a new meetup.
    expect(page).to have_field('name')
    expect(page).to have_field('location')
    expect(page).to have_field('description')
    expect(page).to have_button('Add Meetup')
  end

  scenario "I must supply a name, location, and description and if the form
  submission is successful, I should be brought to the meetup's show page,
  and I should see a message that lets me know that I have created
  a meetup successfully." do

    visit "/meetups"
    sign_in_as user
    click_link('Add New Meetup')
    fill_in('Name:', :with => 'Nice Meetup')
    fill_in('Location:', :with => 'In a very nice place')
    fill_in('Description:', :with => 'A nice meetup indeed')
    click_button('Add Meetup')

    # expect(page.current_path).to eq('/meetups/1')
    expect(page).to have_content("You have succesfully created a meetup")

    expect(page).to have_content("Nice Meetup")
    expect(page).to have_content("In a very nice place")
    expect(page).to have_content("A nice meetup indeed")
  end

  scenario "Form submission is unsuccessful - name field left empty" do
    # I should remain on the meetups new page,
    # and I should see error messages explaining why the form submission was unsuccessful.
    # The form should be pre-filled with the values that were provided when the form
    # was submitted.
    visit "/meetups"
    sign_in_as user
    click_link('Add New Meetup')
    fill_in('Location:', :with => 'In a very nice place')
    fill_in('Description:', :with => 'A nice meetup indeed')
    click_button('Add Meetup')
    # check if it is on the same page
    expect(page).to have_content("Add Meetup")
    expect(page).to have_content("Please enter a name for your meetup!")
    # check for prefilled information
    expect(page).to have_field('Location', with: 'In a very nice place')
    expect(page).to have_content("A nice meetup indeed")
  end
  #
  scenario "Form submission is unsuccessful - location field left empty" do
    # I should remain on the meetups new page,
    # and I should see error messages explaining why the form submission was unsuccessful.
    # The form should be pre-filled with the values that were provided when the form
    # was submitted.
    visit "/meetups"
    sign_in_as user
    click_link('Add New Meetup')
    fill_in('Name:', :with => 'Nice meetup')
    fill_in('Description:', :with => 'A nice meetup indeed')
    click_button('Add Meetup')
    # check if it is on the same page
    expect(page).to have_content("Add Meetup")
    expect(page).to have_content("Please enter a location for your meetup!")
    # check for prefilled information
    expect(page).to have_field('Name', with: 'Nice meetup')
    expect(page).to have_content("A nice meetup indeed")
  end

  scenario "Form submission is unsuccessful - description field left empty" do
    # I should remain on the meetups new page,
    # and I should see error messages explaining why the form submission was unsuccessful.
    # The form should be pre-filled with the values that were provided when the form
    # was submitted.
    visit "/meetups"
    sign_in_as user
    click_link('Add New Meetup')
    fill_in('Name:', :with => 'Nice meetup')
    fill_in('Location:', :with => 'In a very nice place')
    click_button('Add Meetup')

    # check if it is on the same page
    expect(page).to have_content("Add Meetup")
    expect(page).to have_content("Please enter a description for you meetup!")
    # check for prefilled information
    expect(page).to have_field('Name', with: 'Nice meetup')
    expect(page).to have_field('Location', with: 'In a very nice place')
  end

  scenario "Form submission is unsuccessful - user not signed in" do

    visit "/"
    # save_and_open_page
    # user cliks on the add new meetup link
    click_link('Add New Meetup')
    # # And should go to the /meetups/new page
    expect(page.current_path).to eq('/meetups/new')
    # #On this page there is a form to create a new meetup.
    fill_in('Name:', :with => 'Nice meetup')
    fill_in('Description:', :with => 'A nice meetup indeed')
    fill_in('Location:', :with => 'In a very nice place')
    click_button('Add Meetup')

    expect(page).to have_content("You must be signed in to create a meetup!")
  end
end
