source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '4.2.7.1'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'devise'
gem 'haml-rails', '~> 0.8'
gem 'draper'
gem 'decent_decoration'
gem 'decent_exposure'
gem 'bootstrap-sass'
gem 'annotate', '~> 2.6.5'
gem 'httparty'
gem 'dotenv-rails'
gem 'sidekiq'
gem 'swagger-blocks'
gem 'rack-cors', require: 'rack/cors'
gem 'faker', '~> 1.4.3'
gem 'coveralls', require: false

group :production do
  gem "pg"
  gem 'rails_12factor'
end

group :development do
  gem 'rails-erd'
  gem 'better_errors'
  gem 'bullet'
  gem 'pry-rails'
  gem 'binding_of_caller'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'letter_opener'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'simplecov'
end

group :test do
  gem 'shoulda-matchers'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-its'
  gem 'database_cleaner'
  gem 'rspec-sidekiq'
end
