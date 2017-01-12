
user_attributes = [
  { first_name: 'Eric', last_name: 'Kelly', email: 'erickelly@gmail.com' },
  { first_name: 'Adam', last_name: 'Sheehan', email: 'adamsheenan@gmail.com'},
  { first_name: 'Dan', last_name: 'Pickett', email: 'danpickett@gmail.com'},
  { first_name: 'Evan', last_name: 'Charles', email: 'evancharles@gmail.com'},
  { first_name: 'Faizaan', last_name: 'Shamsi'},
  { first_name: 'Helen', last_name: 'Hood'  },
  { first_name: 'Corinne', last_name: 'Babel' }
]

user_attributes.each do |attributes|
  user = User.new(attributes)
  user.save
end

project_attributes = [
  { name: 'Project 1', description: 'Description1' },
  { name: 'Project 2', description: 'Description2'},
  { name: 'Project 3' },
  { name: 'Project 4', description: 'Description4' },
  { name: 'Project 5', description: 'Description5'},
  { name: 'Project 6' },
  { name: 'Project 7', description: 'Description7'},
  { name: 'Project 8' },
  { name: 'Project 9', description: 'Description9' }
]

project_attributes.each do |attributes|
  project = Project.new(attributes)
  project.save
end

projects_users_attributes = [
  { project_id: 1, user_id: 1  },
  { project_id: 2, user_id: 1  },
  { project_id: 3, user_id: 1  },
  { project_id: 1, user_id: 1  },
  { project_id: 2, user_id: 2  },
  { project_id: 4, user_id: 2  },
  { project_id: 4, user_id: 3  },
  { project_id: 5, user_id: 4  },
  { project_id: 5, user_id: 7  },
  { project_id: 6, user_id: 6  },
  { project_id: 6, user_id: 7  },
  { project_id: 8, user_id: 3  },
  { project_id: 9, user_id: 8  }
]

projects_users_attributes.each do |attributes|
  project_user = ProjectsUser.new(attributes)
  project_user.save
end

task_attributes = [
  { name: 'Task 1', description: 'do something 1', due_date: '07/08/2017', project_id: 1, user_id: 1 },
  { name: 'Task 2', description: 'do something 2', due_date: '07/08/2017', project_id: 1},
  { name: 'Task 3',  due_date: '07/08/2017', project_id: 1, user_id: 1 },
  { name: 'Task 4', description: 'do something 4', project_id: 1, user_id: 1 }
]

task_attributes.each do |attributes|
  task = Task.new(attributes)
  task.save
end
