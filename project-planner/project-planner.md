## Instructions

We want to design a database architecture to represent team members working on projects together.

### Getting Set up

Retrieve this challenge via `et` and install the necessary dependencies using the `bundle` command.

```no-highlight
$ cd ~/challenges
$ et get project-planner
$ cd project-planner
$ bundle
```

## Meeting Expectations Requirements

This challenge will test your knowledge of both ActiveRecord and SQL.

Focus on **migrations**, **models**, the database **schema**, and **SQL**. Views for displaying data are not required.

  * The relevant files that will be checked are:
    - All files in the `app/models` directory.
    - All files in the `db/migrate` directory.
    - The `db/seeds.sql` file.
    - The `db/queries.sql` file.
  * You **must** include database constraints and model validations where appropriate.
  * The next two steps require that you to write SQL:
    - **Seed your database** (add records) by writing SQL in `db/seeds.sql` and running `psql project_planner_development < db/seeds.sql`
    - **Query the database** (retrieve records) by writing SQL in `db/queries.sql` and running `psql project_planner_development < db/queries.sql`
    - Details are below, as well as in the SQL files themselves

Create a schema and the necessary migrations and models to represent the following data and object relationships:

#### Users

* Users must have a first name and a last name.
* Users can optionally have an email.
* Users can be involved with multiple projects.

#### Projects

* A project must have a name.
* A project can optionally have a description.
* A project can have many users working on it.

#### Create a Seeder File using SQL

* This file should be located at `db/seeds.sql`
* It should contain the code to create, at least, three users and two projects.
* Check that it works by running `psql project_planner_development < db/seeds.sql`, and ensuring that the records are inserted.

#### Write a SQL query using joins

* This file should be located at `db/queries.sql`
* Write a SQL query to return all the Projects for the User whose `id` is `1`
* Check that it works by running `psql project_planner_development < db/queries.sql`

### Tips

* You should feel free to add whatever additional migrations/models etc. you need to make these associations work.
* Draw out the ER Diagram on paper so that you can understand what data you will need to save and the relationships that you will need to create.
* Test your models in `pry` by running `pry -r "./app.rb"`. For example, you should be able to run `User.first.projects` to get all of the projects for the first user.
* You do not need to add any routes to the application to make it functional for the meet expectations requirement.
* **DO NOT** start the requirements for exceeding expectations before completing the requirements necessary to meet expectations.
* For the seeder, write your own queries **in the provided `db/seeds.sql` file**. Have some fun creating your own data and making sure it's valid.

### Exceeds Expectations Requirements

We now want to be able to add tasks to our app.

#### Tasks

* Tasks must have a name.
* Tasks can optionally have a description and a due date.
* Tasks can optionally be assigned to a single user. (Tasks can also remain unassigned.)
* A task must belong to a single project.

#### Projects

* A project has a collection of individual tasks assigned to it.

#### Update the Seeder File

* Create two tasks.
* Two of the users should belong to the project. Only one of the tasks should be assigned to a user who is in the project.

### Satisfy User Stories

Write an acceptance test for each user story and get the tests to pass.

```no-highlight
As a user
I want to view a list of all projects
So I know what projects are ongoing
```

Acceptance Criteria:

* On the projects index page, I should see the name of each project.
* On the projects index page, the name of each project should be a link to the project's show page.

```no-highlight
As a user
I want to see the details of a project
So I can learn more about each project
```

Acceptance Criteria:

* On a project's show page, I should see the name and description (if any) of the project.

```no-highlight
As a user
I want to see the members of each project
So I know who is working on the project
```

Acceptance Criteria:

* On a project's show page, I should see the first name, last name, and email (if any) of each user who is working on the project.

```no-highlight
As a user
I want to see the tasks of each project
So I know what needs to completed in the project
```

Acceptance Criteria:

* On a project's show page, I should see all the name of each task as well as the first and last name of the user assigned to the task (if there is someone assigned to the task).
