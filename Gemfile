source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem "pg", "~> 0.14"
gem "paranoia", "~> 1.1"
gem "devise", "~> 2.1"
gem "kgio", "~> 2.7"
gem "dalli", "~> 2.5"
gem "seed-fu", "~> 2.2"
gem "sidekiq", "~> 2.5"
gem "pry-rails", "~> 0.2"
gem "hashr", "~> 0"
gem "slim-rails", "~> 1.0"
gem "draper", "~> 0.18"
gem "kaminari", "~> 0.14"
gem "thin"
gem "newrelic_rpm", "~> 3.5.2"
gem "rack-google-analytics", "~> 0.11"
group :development do
  gem "quiet_assets"
end

group :development, :test do
  gem "rspec-rails", "~> 2.11"
end

group :test do
  gem "cucumber-rails", "~> 1.3", :require => false
  gem "database_cleaner"
  gem "machinist"
  gem "pickle"
  gem "poltergeist"
  gem "shoulda-matchers"
end
