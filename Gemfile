source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.2.3'
gem 'rails', '4.2.4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'devise'
gem 'jquery-ui-rails'

#Javascript Stuff
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#Delayed jobs
gem 'delayed_job_active_record'
gem 'daemons'

# full calendar
gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'execjs'
gem 'coffee-script-source'

#Web server
gem 'puma'

#Roles and Auth
gem 'rolify'
gem 'cancancan', '~> 1.10'

#text editor
gem 'ckeditor'

#helps with searching
gem 'ransack'

#pagination
gem 'will_paginate', '~> 3.0.6'
gem 'will_paginate-bootstrap'

group :development, :test do
  #RSpec is used for unit testing
  gem 'rspec-rails', '~> 3.0'

  #Helps with creating objects for testing
  gem 'factory_girl_rails'

  #Used for doing coverage testing on our application
  gem 'simplecov', require: false

  #used for creating seeds. It generates fake data
  gem 'faker'
end

group :development do
  # Use mysql as the database for Active Record
  gem 'mysql2'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  #Helps find n+1 queries
  gem 'bullet'

  #Helps make print out in rails console look better
  gem 'awesome_print'

  #These 2 gems makes it a bit easier to debug issues when they occur
  #This occurs by stopping where the error occurs and giving you a terminial and info on what was going on
  gem 'better_errors', '1.0.1'
  gem 'binding_of_caller', '0.7.2'
end

group :production do
  gem 'rails_12factor', '0.0.3'

  #The database used in production
  gem 'pg', '0.18.3'
end