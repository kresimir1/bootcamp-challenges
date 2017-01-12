## A Brief Review of ER Diagrams

Every project should begin with an Entity Relation (ER) Diagram. You need to understand what objects or tables you need, and how they relate to one another. Your ER diagram should represent the current (or very-soon-to-be) reality of your database schema. This will also help to become your do-it-now list.

Avoid trying to have an ER diagram that attempts to "plan everything" up front. There is a balancing act between doing some amount of architectural planning and "over engineering" by trying to design the whole thing up front.

Here are the basic guidelines for creating an ER diagram.

1. Draw a box for each table you plan on having in your database
2. Inside each box, write the name of the database table, and list each column name you plan on having in the table
3. Draw lines between the tables that are connected to each other. (i.e, the character table and a table that has a column for character_id are connected.)

Possible tools:

* [Google Drawings](https://support.google.com/docs/answer/179740?hl=en)
* [Draw.io](https://www.draw.io/) (free and... ok)
* [Lucidchart](https://www.lucidchart.com/) (nicer but not free, 30-day free trial)
* Whiteboard and Photo, or Pen and Paper (this works just fine; take a picture!)

_A key thing to note_: if you find your ER diagram becoming too complicated or cumbersome, that is usually a red flag that your app might be too difficult to achieve in a reasonable span of time. It is best to come up with a base for your app in your ER diagram and expand on that over time.

By this point, you should have met with your Senior Technical Instructor to solidify your Capstone Project idea. Amongst other things, you should have established what your starting point will be in tackling the app - what your first model will be, and what the first couple features involving that model will be. If you feel unsure about this, reach out to your Senior Technical Instructor, since you'll need that plan for this next step!

## A Brief Review of Writing User Stories and Acceptance Criteria

Before you start building your app, you want to describe the functionality you're building by writing *User Stories*. User Stories describe features for which we can write straightforward tests and subsequent code to make them realities in our app. This allows us to plan the creation of our app and streamline the code-writing process. Also, this gives a chance to detect any large features and break them down into multiple smaller features. Here's an example of a user story:

```
As a Signed-in user
I want to create a friend group
So I have a place to share all my sweet tunes to my friends
```

This story has a clear objective and a purpose for my app. Each story should correspond to a specific Capybara feature test, as well as any RSpec model tests for any model creation or class method creation.

Once you have successfully solidified the user story, write the acceptance criteria. Remember, acceptance criteria should describe more about the results, and less about _how_ those results are achieved. For the user story above, our acceptance criteria might look like:

```
Acceptance Criteria:

* I cannot create a friend group unless I'm signed in
* If I'm not signed in and I attempt to create a friend group, I'm redirected and prompted to sign in
* I must specify a unique name for a new friend group
* If I supply a duplicate name or a blank name, I receive an error message
```

## What to Submit

### ER Diagrams

Please submit two ER diagrams:

- One diagram that represents the future state of your database after you finish your very first couple features. This should only be *one or two models*.
- One diagram that represents a more complete view of where you would like your models/database to go. This can include most/all of the models you plan on (reasonably) including your app in the next two weeks. (It is okay if this changes as you go, we just want to get a sense of where you are going in the longer term.)

Make sure to clearly name these ER diagrams so we can easily tell them apart.

### User Stories and Acceptance Criteria

For each of your very first features that you plan on working on, write out a set of user stories and acceptance criteria. Remember that even though you might be thinking of something as one big "feature" (i.e. "I want to let people post songs on my site"), it can probably be broken down into smaller features. (I.e., "Users can view a list of songs", "User can add a new song", "User can delete a song they added", "User can edit a song submission they made".) Each of those smaller features should have its own set of acceptance criteria.

## How to Submit

For your ER diagrams, please submit image files. (I.e., if you made a diagram on Draw.io, take a screenshot!). You can submit your user stories and acceptance criteria in any text format you'd like. Markdown, .txt, .doc files, or even links to Google Docs are all fine!

Again, please contact your Senior Technical Instructor to review your ER diagrams, user stories, and acceptance criteria. Once you have this submitted you can dive into your app!
