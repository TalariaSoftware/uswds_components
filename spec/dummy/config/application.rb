require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require 'uswds_components'

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f

    config.view_component.default_preview_layout = 'application'
    config.view_component.show_previews = true
    config.view_component.preview_paths <<
      UswdsComponents::Engine.root.join('spec/components/previews')
  end
end
