require_relative "lib/uswds_components/version"

Gem::Specification.new do |spec|
  spec.name        = "uswds_components"
  spec.version     = UswdsComponents::VERSION
  spec.authors     = ["Damien Burke"]
  spec.email       = ["damien@damienburke.com"]
  spec.homepage    = "https://github.com/TalariaSoftware/uswds_components"
  spec.summary     = "Rails view components for the USWDS design system"
  spec.description = "Rails view components for the USWDS design system" # TODO

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/TalariaSoftware/uswds_components"
  spec.metadata["changelog_uri"] = "https://github.com/TalariaSoftware/uswds_components/commits/main" # Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "LICENSE.md", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 7.0.0.alpha2"
  spec.add_dependency "view_component"
  spec.add_dependency "haml-rails"

  spec.add_development_dependency "capybara"
  spec.add_development_dependency "puma"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rspec-rails"
end
