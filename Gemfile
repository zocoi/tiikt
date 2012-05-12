source 'https://rubygems.org'

gem 'rails', '~>3.2.1'
gem 'delayed_job_active_record'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# User Devise user authentication
gem 'devise'

# OmniAuth
gem 'omniauth'
gem "omniauth-facebook"

# Facebook Graph
gem 'fb_graph'

# Backbone
gem 'backbone-on-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test, :development do
  gem 'minitest-rails'
end

group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
  gem 'database_cleaner'
  gem 'simplecov'
end