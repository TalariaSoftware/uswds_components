source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in uswds_components.gemspec.
gemspec

gem 'sqlite3', group: :development

gem 'simplecov', require: false, group: :test

group :production do
  gem 'pg'
  gem 'puma'
end

# Start debugger with binding.b -- Read more: https://github.com/ruby/debug
# gem "debug", ">= 1.0.0", group: %i[ development test ]
