if Gem::Specification.find_all_by_name('rubocop').present?
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
end
