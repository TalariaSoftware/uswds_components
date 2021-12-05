if Gem::Specification.find_all_by_name('bundler-audit').present?
  require 'bundler/audit/task'
  Bundler::Audit::Task.new
end
