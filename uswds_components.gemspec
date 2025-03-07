require_relative 'lib/uswds_components/version'

Gem::Specification.new do |spec|
  spec.name        = 'uswds_components'
  spec.version     = UswdsComponents::VERSION
  spec.authors     = ['Damien Burke']
  spec.email       = ['damien@damienburke.com']
  spec.homepage    = 'https://github.com/TalariaSoftware/uswds_components'
  spec.summary     = 'Rails view components for the USWDS design system'
  spec.description = 'Rails view components for the USWDS design system' # TODO
  spec.license     = 'Hippocratic-3.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # Require multifactor auth to push to rubygems
  spec.metadata = { 'rubygems_mfa_required' => 'true' }

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/TalariaSoftware/uswds_components'

  # Put your gem's CHANGELOG.md URL here."
  spec.metadata['changelog_uri'] = 'https://github.com/TalariaSoftware/uswds_components/commits/main'

  spec.files = Dir['{app,config,db,lib}/**/*', 'LICENSE.md', 'Rakefile',
    'README.md']

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'haml-rails'
  spec.add_dependency 'rails', '>= 6.1.4.1'
  spec.add_dependency 'view_component', '>= 3', '< 3.15'
end
