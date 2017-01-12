# Game Collector

Here, we have an app that tracks users and their board game collections. As an administrator of the site, we would like to be able to see a list of users. Since this feature should only be available to users with the admin role, it would be useful to namespace this feature to keep it separate from how regular users interact with the site.

Let's test drive adding a namespaced feature, where only administrators have access.

## Learning Objectives
* Implement a Namespace in Rails
* Use TDD, with a focus on reading error messages, to build this feature.

## User Stories

```no-highlight
As an administrator of the Game Collector Website
I want to see a list of users and email addresses
So that I can view who is using my website.
```

## ER Diagram

```no-highlight
  +--------------+                                   +------------+
  |  BoardGames  |     +-----------------------+     |   Users    |
  +--------------+     |  BoardGameCollection  |     +------------+
  | name         |     +-----------------------+     | first_name |
  | publisher    |    /| user_id               |\    | last_name  |
  | description  +-----+ board_game_id         +-----+ email      |
  | release_date |    \|                       |/    | role       |
  |              |     +-----------------------+     |            |
  +--------------+                                   +------------+
```
created with [asciiflow](http://asciiflow.com/)


## Game Collector Repository

Clone the repository.

```no-highlight
et get game_collector
```

Here is a rundown of the steps we did to get the application to the state it is currently in:

1. Add devise to the gemfile
2. `bundle install`
3. `rails g devise:install`
4. Follow instructions generated by devise
5. `rails g devise user`
6. Create models
7. Write model tests
8. Create factories for models


## Implementation

Let's write the specs for the feature and implement it.

Write the test:

*spec/features/admin_views_users_page_spec.rb*

```
require 'rails_helper'

feature 'admin can see a list of users' do

  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'admin visits users index' do
    login_as(admin)
    visit '/admin/users'
    expect(page).to have_content(user.email)
  end

end
```

Run the test with `rspec spec/features/admin_views_users_page_spec.rb`

*failing test*

```
$ rspec spec/features/admin_views_users_page_spec.rb
F

Failures:

  1) admin can see a list of users admin visits users index
     Failure/Error: visit '/admin/users'
     ActionController::RoutingError:
       No route matches [GET] "/admin/users"
     # ./spec/features/admin_views_users_page_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 0.06069 seconds (files took 2.52 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/features/admin_views_users_page_spec.rb:8 # admin can see a list of users admin visits users index
```

### Reading Error Messages

The ability to decipher error messages is a valuable skill. Let's look at the output of our failing test, and see if we can glean some information from it: `'No route matches [GET] "admin/users"'. # ./spec/features/admin_views_users_page_spec.rb:10`.

If this error message makes absolutely no sense to us, it at least gives us a clue: a filename and a line number of where the error is occuring. Let's look at line 10 the admin\_views\_user\_page\_spec.rb: `visit '/admin/users'`. The error occurs when we try to check out the /admin/users path of our application.

We could do a search for this error message: `'No route matches [GET] "admin/users"'` and see what we get back. After reading a few stackoverflow posts, we learn about the `rake routes` command, and try that out:

```
$ rake routes
                  Prefix Verb   URI Pattern                     Controller#Action
        new_user_session GET    /users/sign_in(.:format)        devise/sessions#new
            user_session POST   /users/sign_in(.:format)        devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)       devise/sessions#destroy
           user_password POST   /users/password(.:format)       devise/passwords#create
       new_user_password GET    /users/password/new(.:format)   devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format)  devise/passwords#edit
                         PATCH  /users/password(.:format)       devise/passwords#update
                         PUT    /users/password(.:format)       devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)         devise/registrations#cancel
       user_registration POST   /users(.:format)                devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)        devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)           devise/registrations#edit
                         PATCH  /users(.:format)                devise/registrations#update
                         PUT    /users(.:format)                devise/registrations#update
                         DELETE /users(.:format)                devise/registrations#destroy
                    root GET    /                               board_games#index
             board_games GET    /board_games(.:format)          board_games#index
                         POST   /board_games(.:format)          board_games#create
          new_board_game GET    /board_games/new(.:format)      board_games#new
         edit_board_game GET    /board_games/:id/edit(.:format) board_games#edit
              board_game GET    /board_games/:id(.:format)      board_games#show
                         PATCH  /board_games/:id(.:format)      board_games#update
                         PUT    /board_games/:id(.:format)      board_games#update
                         DELETE /board_games/:id(.:format)      board_games#destroy
```

After reading about [routes](http://guides.rubyonrails.org/routing.html), we learn that Rails uses the `config/routes.rb` file to determine which controller action to execute depending on the path that the user visits. The `rake routes` command interprets the `config/routes.rb` file, and shows us what paths exist in our application.

Going back to the error, our test is attempting to visit the `/admin/users` path. We can see from the `rake routes` command that the `/admin/users` path doesn't exist. That is the cause of the error. Let's add a route:

*config/routes.rb*

```
namespace :admin do
  resources :users, only: [:index]
end
```

Now that we have a route to `/admin/users`, run the test again: `rspec spec/features/admin_views_users_page_spec.rb`

*failing test*

```
$ rspec spec/features/admin_views_users_page_spec.rb                                                 1 ↵
F

Failures:

  1) admin can see a list of users admin visits users index
     Failure/Error: visit '/admin/users'
     ActionController::RoutingError:
       uninitialized constant Admin
     # ./spec/features/admin_views_users_page_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 0.06443 seconds (files took 2.67 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/features/admin_views_users_page_spec.rb:8 # admin can see a list of users admin visits users index
```

### Create the Admin Namespace

'ActionController::RoutingError: uninitialized constant Admin'. The router can't find the Admin namespace. Let's create a folder under controllers called 'admin'.

*create folder*

```no-highlight
mkdir app/controllers/admin
```

Run the test:

*failing test*

```
$ rspec spec/features/admin_views_users_page_spec.rb                                                 1 ↵
F

Failures:

  1) admin can see a list of users admin visits users index
     Failure/Error: visit '/admin/users'
     ActionController::RoutingError:
       uninitialized constant Admin::UsersController
     # ./spec/features/admin_views_users_page_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 0.06482 seconds (files took 2.55 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/features/admin_views_users_page_spec.rb:8 # admin can see a list of users admin visits users index
```

The presence of the `app/controllers/admin` folder gets us one step further. Our new error message is: 'uninitialized constant Admin::UsersController'. The router can find a UsersController. Let's create one:

*create a controller*

```no-highlight
touch app/controllers/admin/users_controller.rb
```

*app/controllers/admin/users_controller.rb*

```
module Admin
  class UsersController < ApplicationController
  end
end
```

we can also define the controller this way

*app/controllers/admin/users_controller.rb*

```
class Admin::UsersController < ApplicationController
end
```

Run the test:

*failing test*

```
$ rspec spec/features/admin_views_users_page_spec.rb
F

Failures:

  1) admin can see a list of users admin visits users index
     Failure/Error: visit '/admin/users'
     AbstractController::ActionNotFound:
       The action 'index' could not be found for Admin::UsersController
     # ./spec/features/admin_views_users_page_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 0.08282 seconds (files took 2.64 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/features/admin_views_users_page_spec.rb:8 # admin can see a list of users admin visits users index
```

### Create the Controller

"The action 'index' could not be found for Admin::UsersController". Let's create an index method in the UsersController.

*app/controllers/admin/users\_controller.rb*

```
class Admin::UsersController < ApplicationController
  def index
  end
end
```

Run the test:

*failing test*

```
$ rspec spec/features/admin_views_users_page_spec.rb                                                 1 ↵
F

Failures:

  1) admin can see a list of users admin visits users index
     Failure/Error: visit '/admin/users'
     ActionView::MissingTemplate:
       Missing template admin/users/index, application/index with {:locale=>[:en], :formats=>[:html], :variants=>[], :handlers=>[:erb, :builder, :raw, :ruby, :coffee, :haml]}. Searched in:
         * "/Users/rd/Dropbox/code/game_collector/app/views"
         * "/Users/rd/.gem/ruby/2.0.0/gems/devise-3.2.4/app/views"
     # ./spec/features/admin_views_users_page_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 0.07692 seconds (files took 2.53 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/features/admin_views_users_page_spec.rb:8 # admin can see a list of users admin visits users index
```

### Create the View

"Missing template admin/users/index". Let's give the test what it wants:

*create a users index template*

```no-highlight
mkdir app/views/admin
mkdir app/views/admin/users
touch app/views/admin/users/index.html.erb
```

Run the test:

*failing test*

```
F

Failures:

  1) admin can see a list of users admin visits users index
     Failure/Error: expect(page).to have_content(user.email)
       expected to find text "gamefan1@gmail.com" in ""
     # ./spec/features/admin_views_users_page_spec.rb:11:in `block (2 levels) in <top (required)>'

Finished in 0.12682 seconds (files took 2.52 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/features/admin_views_users_page_spec.rb:8 # admin can see a list of users admin visits users index
```

'expected to find text "gamefan1@gmail.com" in ""'. The test is looking for the user's email in a blank template. Let's write some code for the index view:

*update the controller*

```
class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end
end
```

*write the view*

```no-highlight
This is left as an exercise for the reader.
```

Run the test:

*green spec*

```
$ rspec spec/features/admin_views_users_page_spec.rb                                                 1 ↵
.

Finished in 0.13056 seconds (files took 2.58 seconds to load)
1 example, 0 failures
```

### Test-Driven Development

There is a definite pattern here:

1. Run the test
2. Read the error message
3. Write only the code necessary to make the error go away
4. Repeat.

When we utilize test-driven development, we only write the code needed to satisfy the conditions of the test. That means, we aren't wasting time writing unnecessary code. Our codebase is lean, and every line of code has a reason to exist.

## Deny Access to Unauthorized Users

Another important component to this feature is that unauthorized users are not allowed to see this page. Let's write a test for that.

*spec/features/admin\_views\_users\_page\_spec.rb*

```
scenario 'unauthorized users are redirected' do
  login_as(user)
  visit '/admin/users'
  expect(page).to have_content('not authorized')
  expect(current_path).to eq(root_path)
end
```

*failing test*

```
$ rspec spec/features/admin_views_users_page_spec.rb
.F

Failures:

  1) admin can see a list of users unauthorized users are redirected
     Failure/Error: expect(page).to have_content('Unauthorized')
       expected to find text "not authorized" in "Listing Users email Sign in count Last visited Role gamefan3@gmail.com 1 2014-06-28 16:27:59 UTC user"
     # ./spec/features/admin_views_users_page_spec.rb:17:in `block (2 levels) in <top (required)>'

Finished in 0.1576 seconds (files took 2.49 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/features/admin_views_users_page_spec.rb:14 # admin can see a list of users unauthorized users are redirected
```

*app/controllers/admin/users_controller.rb*

```
class Admin::UsersController < ApplicationController
  before_filter :authorize_admin!
  def index
    @users = User.all
  end
end
```

*app/controllers/application_controller.rb*

```
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize_admin!
    if current_user.nil? or !current_user.is_admin?
      flash[:notice] = "You are not authorized to view this resource."
      redirect_to root_path
    end
  end
end
```

*app/models/user.rb*

```
def is_admin?
  role == 'admin'
end
```

*green specs*

```
$ rspec spec/features/admin_views_users_page_spec.rb
..

Finished in 0.16886 seconds (files took 2.61 seconds to load)
2 examples, 0 failures
```

## Rules to Follow

### Use a namespace to separate parts of your application

Whenever you have a part of your application that should behave differently for different user roles, don't pollute your views and controllers with `if` statements. Namespace the feature to keep your codebase clean.

### Test Drive Your Development

When you are unsure of where to start, the answer is to write a test. The error messages given to you by a correctly written test will guide you in your development.

### Red, Green, Refactor

Once your tests are green, commit your changes, and then take the time to review your code. There will probably be obvious ways to DRY up your code, or if things seem a bit messy, it might be worthwhile to extract some logic into a class. Remember that once the tests are green, that's the time to review what you have written and make it clean and concise.