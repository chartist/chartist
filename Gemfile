source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# Use postgresql as the database for Active Record
gem 'pg'
gem 'devise'
gem 'bootstrap-sass'
gem 'paperclip', github: 'thoughtbot/paperclip'
gem 'aws-sdk'
gem 'font-awesome-sass'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'geocoder'
gem 'websocket-rails'
gem "jquery-rails"

group :production do
  gem 'rails_12factor'
  gem 'heroku_secrets', github: 'alexpeattie/heroku_secrets'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem  'poltergeist'
  gem 'database_cleaner'
  gem 'guard-rspec', require: false
  gem 'annotate', ">=2.6.0"
  gem 'capybara-email'
  gem 'mailcatcher'
end


# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'



group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
