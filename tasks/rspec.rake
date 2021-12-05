begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError # rubocop:disable Lint/SuppressedException
end
