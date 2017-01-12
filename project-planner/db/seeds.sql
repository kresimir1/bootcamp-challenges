-- Write SQL statements to seed your database
-- It should contain the code to create, at least, three users and two projects.
-- Check that it works by running `psql project_planner_development < db/seeds.sql`, and ensuring that the records are inserted.

User.create( first_name: 'Eric', last_name: 'Kelly', email: 'erickelly@gmail.com', project_id: 1 )
User.create( first_name: 'Adam', last_name: 'Sheehan', email: 'adamsheenan@gmail.com', project_id: 2 )
User.create( first_name: 'Dan', last_name: 'Pickett', email: 'danpickett@gmail.com', project_id: 2)
User.create( first_name: 'Evan', last_name: 'Charles', email: 'evancharles@gmail.com', project_id: 3 )
User.create( first_name: 'Faizaan', last_name: 'Shamsi', project_id: 1 )
User.create( first_name: 'Helen', last_name: 'Hood', project_id: 2 )
User.create( first_name: 'Corinne', last_name: 'Babel', project_id: 4 )

Project.create(name: 'Project 1', description: 'Description1', user_id: 1 )
Project.create(name: 'Project 2', description: 'Description2', user_id: 2 )
Project.create(name: 'Project 3', user_id: 3 )
Project.create(name: 'Project 4', description: 'Description4', user_id: 4 )
Project.create(name: 'Project 5', description: 'Description5', user_id: 5 )
Project.create(name: 'Project 6', user_id: 6 )
Project.create(name: 'Project 7', description: 'Description7', user_id: 7 )
Project.create(name: 'Project 8', user_id: 5 )
Project.create(name: 'Project 9', description: 'Description9', user_id: 1 )
