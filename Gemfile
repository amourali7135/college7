source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.3.5"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"  Le Wagon tech head said to remove it...62022

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem "devise"
gem "autoprefixer-rails"
gem "font-awesome-sass", "~> 6.1"
gem "simple_form", github: "heartcombo/simple_form"
# Run in root to find issues against Rails best practices!  Clutch.
gem "rails_best_practices"
# Prevent dangerous migrations.
# gem "strong_migrations"
# For image uploads...for now at least.
gem 'cloudinary'
# For easy active storage + photo validations 
gem 'active_storage_validations'
# To try and get this shit working.  
gem 'htmlbeautifier'
# Replace stupid other linter
gem 'erb_lint', require: false
# For saving favorite programs and applications.
gem 'acts_as_votable'
# For tagging important things like categories for easier search
gem 'acts-as-taggable-on', '~> 9.0'
# For multi-select functionality...find a select2 alternative that works later on.
# gem...
# For basic search functionality on the program model.  Switch to ES later if advanced features needed.
gem 'pg_search'
# For geocoding + better search results for users
gem "geocoder"
# Pagination experiment.
gem 'pagy'
# Cannot get Bootstrap working, so try this way.
# gem 'bootstrap', '~> 5.1.3'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'


end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', require: false
  # Memory usage in app.  For development only though?  Check when on Heroku.  
  gem 'memory_profiler'
  # For call-stack profiling flamegraphs with rack mini profiler
  gem 'stackprof'
  # From last Le Wagon template
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Makes spring work better by listening for changes.
  # gem 'spring-watcher-listen', '~> 2.0.0'
  # For having a better error page in development with console.
  gem "better_errors"
  # For tracing variables that lead to app crashing in better errors screen.
  gem "binding_of_caller"
  # Fasterer was installed via CLI.  Just type fasterer into the Terminal and it'll launch.  
  # Find N +1 queries more efficiently
  gem 'bullet'
  # Formatter to save time, if it works.
  gem 'htmlbeautifier'


end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  # I don't even remember what this one does...
  gem 'launchy'
  # 
  gem 'shoulda-matchers'
  # Use fake data in app.
  gem "faker"
  
end
