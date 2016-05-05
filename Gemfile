source 'https://rubygems.org'

ruby '2.3.0'

# Backend
gem 'rails', '>= 5.0.0.beta4', '< 5.1' # Latest stable
gem 'pg' # Use Postgresql as database
gem 'active_model_serializers', '~> 0.10.0.rc4' # ActiveModel::Serializer implementation and Rails hooks
gem 'carrierwave' # Classier solution for file uploads for Rails
gem 'carrierwave-aws'
gem 'mini_magick' # A ruby wrapper for ImageMagick or GraphicsMagick command line
gem 'chronic' # Chronic is a pure Ruby natural language date parser.
gem 'paranoia' # Paranoia is a re-implementation of acts_as_paranoid for Rails 3, 4, and 5. Soft-deletion of records
gem 'ffaker' # A library for generating fake data such as names, addresses, and phone numbers.
gem 'factory_girl_rails'
gem 'puma', '~> 3.0'

# Authentications & Authorizations
gem 'devise' # Authentication solution for Rails with Warden
gem 'doorkeeper', '~> 4.0.0.rc3' # OAuth 2 provider
gem 'cancancan', '~> 1.10' # Continuation of CanCan, the authorization Gem for Ruby on Rails.

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'rack-attack'

group :development, :test do
  gem 'figaro' # Simple Rails app configuration
  gem 'rspec-rails' # Rails testing engine
  gem 'rspec-retry' # Retry randomly failing rspec example.
  gem 'shoulda-matchers' # Tests common Rails functionalities
  gem 'database_cleaner' # Use Database Cleaner
  gem 'byebug', platform: :mri # Call 'byebug' anywhere in the code to stop execution and get a debugger console
end

group :development do
  gem 'better_errors' # Better error page for Rails and other Rack apps
  gem 'binding_of_caller' # Retrieve the binding of a method's caller in MRI 1.9.2+
  gem 'quiet_assets' # For cleaner logs
  gem 'awesome_print' # Pretty print your Ruby objects with style -- in full color and with proper indentation
  gem 'listen', '~> 3.0.5'
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
