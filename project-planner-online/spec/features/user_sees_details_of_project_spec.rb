require "spec_helper"


feature "user views details of projects" do
# As a user
# I want to see the details of a project
# So I can learn more about each project
  scenario "view details of a project" do
    # Acceptance Criteria:

    project1 = Project.create!({
        name: "Project1", description: "description1"
      })

    user1 = User.create!({
      first_name: 'first_name1', last_name: 'last_name1', email: 'email1'
      })
    user2 = User.create!({
        first_name: 'first_name2', last_name: 'last_name2'
        })
    project_user1 = ProjectsUser.create!({
       project_id: 1, user_id: 1
      })
    project_user2 = ProjectsUser.create!({
       project_id: 1, user_id: 2
      })
    task1 = Task.create!({
      name: 'Task 1', description: 'do something 1', due_date: '07/08/2017', project_id: 1, user_id: 1
      })
      task1 = Task.create!({
        name: 'Task 2', description: 'do something 2', due_date: '07/08/2017', project_id: 1, user_id: 2
        })


    url = "/projects/#{project1.id}"
    visit "/"
    click_link('Project1')
    # save_and_open_page

    expect(page.current_path).to eq(url)
    # On a project's show page, I should see the name and description (if any) of the project.
    expect(page).to have_content("Project1")
    expect(page).to have_content("description1")

    # On a project's show page, I should see the first name, last name, and email (if any) of each user who is working on the project.
    expect(page).to have_content("first_name1")
    expect(page).to have_content("last_name1")
    expect(page).to have_content("first_name2")
    expect(page).to have_content("first_name2")
    expect(page).to have_content("email1")

    # On a project's show page, I should see all the name of each task as well as the first and last name of the user assigned to the task (if there is someone assigned to the task).
    expect(page).to have_content("Task 1")
    expect(page).to have_content("Task 2")

    expect(page).to have_content("first_name1", count: 2)
    expect(page).to have_content("last_name1", count: 2)
    expect(page).to have_content("first_name2", count: 2)
    expect(page).to have_content("last_name2", count: 2)


  end
end
