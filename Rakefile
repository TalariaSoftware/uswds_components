require 'bundler/setup'

APP_RAKEFILE = File.expand_path('spec/dummy/Rakefile', __dir__)
load 'rails/tasks/engine.rake'

load 'rails/tasks/statistics.rake'

require 'bundler/gem_tasks'

Dir.glob('tasks/*.rake').each { |r| import r }

task default: %i[
  rubocop
  app:haml_lint
  spec
  license_finder
  brakeman:check
  bundle:audit
]
