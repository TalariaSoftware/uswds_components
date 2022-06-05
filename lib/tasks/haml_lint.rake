if Gem::Specification.find_all_by_name('haml-lint').present?
  require 'haml_lint/rake_task'
  HamlLint::RakeTask.new
end
