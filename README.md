Steps taken to create the app:

- Create a directory and a _Gemfile_
```
source 'https://rubygems.org'
gem 'rails', '~> 5.2'
```
- Run ```bundle``` from command line.
- Run ```bundle exec rails new . -T --webpack```
- Add the following to the Gemfile to install Rspec for Rails and run ```bundle```:
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

- Rename *app/assets/stylesheets/application.css* to a *.scss* type of file (sass)
