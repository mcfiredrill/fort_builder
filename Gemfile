source 'https://rubygems.org'
ruby "2.2.2"

gem 'rails', '4.2.1'
gem 'rails-api'
gem 'sqlite3'
gem 'active_model_serializers'

gem 'rack-cors', :require => 'rack/cors'

# Use unicorn as the app server
gem 'unicorn'

gem 'pry'

# for heroku
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# testing
gem 'rspec-rails', :group => [:test,:development]
