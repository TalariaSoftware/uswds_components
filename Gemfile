source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in uswds_components.gemspec.
gemspec

ruby ENV['RUBY_VERSION'] if ENV['RUBY_VERSION'].present?

gem 'lookbook'

gem 'brakeman'
gem 'bundler-audit'
gem 'capybara'
gem 'cssbundling-rails'
gem 'debug'
gem 'haml-lint'
gem 'html-proofer', '~>3' # v4 doesn't support HTMLProofer::Middleware https://github.com/gjtorikian/html-proofer/pull/670
gem 'license_finder'
gem 'propshaft'
gem 'puma'
gem 'rspec-rails'
gem 'rubocop'
gem 'rubocop-rspec'

group :development do
  gem 'sqlite3'
end

group :test do
  gem 'simplecov', require: false
end

group :production do
  gem 'pg'
end
