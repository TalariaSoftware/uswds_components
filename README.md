# USWDS Components

Implementation of the [US Web Design System (USWDS)](https://designsystem.digital.gov) as [ViewComponents](https://viewcomponent.org) for use with Ruby on Rails.

## Usage

Example usage of the [alert component.](https://designsystem.digital.gov/components/alert/)

```haml
= render UswdsComponents::AlertComponent.new(status: error, heading: 'Access
denied') do
  You do not have permission to view that page.
```

```erb
<%= render UswdsComponents::AlertComponent.new(status: error, heading: 'Access
denied') do %>
  You do not have permission to view that page.
<% end %>
```

## Installation

### USWDS CSS/JavaScript

Add the USWDS CSS and JavaScript to your application.

In your application layout, add links uswds.min.css, uswds.min.js, and uswds-init.js from a JavaScript CDN like [JSDelivr](https://www.jsdelivr.com/package/npm/uswds), [JSPM](https://jspm.org), or [UNPKG](https://unpkg.com).

Alternatively, use Yarn (or NPM) to [install](https://designsystem.digital.gov/documentation/getting-started/developers/phase-one-install/) the [Node package](https://www.npmjs.com/package/uswds) and link to it locally.

### Ruby gem

Add this line to your application's Gemfile:

```ruby
gem 'uswds_components'
```

## Previews

View Component [previews](https://viewcomponent.org/guide/previews.html) show
what the components look like and provide examples on how to use them.

Add this to `config/application.rb` to enable view component previews, add USWDS
Components previews, and show preview source.

```ruby
config.view_component.show_previews = true
config.view_component.show_previews_source = true
config.view_component.preview_paths <<
  UswdsComponents::Engine.root.join('spec/components/previews')
```

Then access the resulting previews at: http://localhost:3000/rails/view_components.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [Hippocratic License 3.0](https://firstdonoharm.dev).
