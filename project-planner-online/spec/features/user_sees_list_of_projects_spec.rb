require "spec_helper"


require "spec_helper"

feature "user views list of projects" do
  # As a user
  # I want to view a list all projects so I see which ones are ongoing
  # I want to click on the project name to se the details
  #
  # Acceptance Criteria:
  #
  # On the projects index page, I should see the name of each project.
  # On the projects index page, the name of each project should be a link to the project's show page.

  scenario "view list of projects" do
    project1 = Project.create!({
        name: "Project1", description: "description1"
      })
    project2 = Project.create!({
          name: "Project2", description: "description2"
        })
    # The user visits the index page
    visit "/"
    # And should see both projects listed (just the name)
    expect(page).to have_content("Project1")
    expect(page).to have_content("Project2")
  end

  scenario "each project name on the list is a link to project details" do
    project1 = Project.create!({
        name: "Project1", description: "description1"
      })

      project2 = Project.create!({
          name: "Project2", description: "description2"
        })

    url = "/projects/#{project1.id}"

    visit "/"
    click_link('Project1')
    # save_and_open_page
    expect(page.current_path).to eq(url)
    expect(page).to have_content("Project1")
    expect(page).to have_content("description1")
  end


end
