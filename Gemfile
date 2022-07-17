source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in uswds_components.gemspec.
gemspec

gem 'lookbook'

group :development do
  gem 'sqlite3'
end

group :test do
  gem 'simplecov', require: false
end

group :production do
  gem 'pg'
  gem 'puma'
end
