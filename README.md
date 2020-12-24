Steps taken to create the app:

- Create a directory and a _Gemfile_
```
source 'https://rubygems.org'
gem 'rails', '~> 5.2'
```
- Run ```bundle``` from command line.
- Run ```bundle exec rails new . -T --webpack```
- Add the following to the Gemfile to install Rspec for Rails, run ```bundle```:
```
group :development, :test do
  gem 'rspec-rails', '~> 4.0.1'
end
```
- Run ```bundle update``` if suggested by the terminal (Windows might require this).
- Run ```rails generate rspec:install``` to complete Rspec's installation.
- Add ```gem 'capybara'``` in the same group as 'rspec-rails' and run ```bundle install```.
- Add ```require 'capybara/rails'``` to the *test_helper.rb* file.
- Run ```yarn add bootstrap```
- Run ```rails webpacker:install```

The app is now live and can be visited locally at *localhost:3000* after starting the service by running ```rails s``` from the command line.

- Rename *app/assets/stylesheets/application.css* to a *.scss* type of file (sass).
- Add ```@import "bootstrap/scss/bootstrap";``` to that new scss file.

- Add ```pages#home``` as the root route in *routes.rb*. Add *pages_controller.rb* with a ```home``` action. Add *home.html.erb*. Add the navbar in *application.html.erb*.

- Add ```gem 'devise'``` and run ```bundle install``` for session management.
- Run ```rails g devise:install``` and ```rails g devise:views``` and ```rails g devise user username first_name last_name```.
- In the newly created migration, add ```, null: false``` to all three fields (username, first_name and last_name) as well as ```add_index :users, :username,         unique: true```. Run the migration (```rails db:migrate```).

- Add validations to *user.rb* model:
```
validates :username, presence: true, uniqueness: { case_sensitive: false }
validates :first_name, presence: true
validates :last_name, presence: true
```

- As suggested by the Devise documentation, add the following to *application_controller.rb*:
```
before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end
```

- Add a **full_name** method to *user.rb*:
```
def full_name
  [first_name, last_name].join(' ')
end
```

- Add a **category** model: ```rails g model category user:belongs_to name:string```
- Specify in the **user** model: ```has_many :categories```

- Create a profile page by username. In *routes.rb*, specify ```get '/@:username', to: 'users#show', as: :profile```. Create *users_controller.rb* and specify a **show** action:
```
class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
  end
end
```
Create a *show.html.erb* view under *views/users*.
