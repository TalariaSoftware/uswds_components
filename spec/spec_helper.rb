require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4.
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # This will default to `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off).
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = "tmp/examples.txt"
  config.disable_monkey_patching!

  # if config.files_to_run.one?
  #   # Use the documentation formatter for detailed output, unless a formatter
  #   # has already been configured
  #   config.default_formatter = "doc"
  # end

  config.order = :random
  Kernel.srand config.seed
end
