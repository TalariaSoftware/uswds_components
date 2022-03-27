![Spec suite](https://github.com/TalariaSoftware/uswds_components/actions/workflows/ruby.yml/badge.svg)
![CodeQL Analysis](https://github.com/TalariaSoftware/uswds_components/actions/workflows/codeql-analysis.yml/badge.svg)

# USWDS Components

Implementation of the [US Web Design System
(USWDS)](https://designsystem.digital.gov) as
[ViewComponents](https://viewcomponent.org) for use with Ruby on Rails.

## Why

ViewComponent is a framework for creating view components, Ruby objects to build
markup that can be reusuable, testable, and encapsulated.

USWDS is a design system created by [18F](https://18f.gsa.gov/) to make it
easier to build accessible, mobile-friendly sites.

USWDS Components uses View Components to make it easy to add USWDS components to
your Rails application.

## Usage

Example usage of the [alert component.](https://designsystem.digital.gov/components/alert/)

HAML:
```haml
= render UswdsComponents::AlertComponent.new(status: error, heading: 'Access
denied') do
  You do not have permission to view that page.
```

ERB:
```erb
<%= render UswdsComponents::AlertComponent.new(status: error, heading: 'Access
denied') do %>
  You do not have permission to view that page.
<% end %>
```

## Installation

### USWDS installation

USWDS is installed by including these three files in your application layout:

1. `uswds.css`: the USWDS stylesheet. Put this in the head of HTML layout,
   before the application-specific CSS.
2. `uswds.js`: JavaScript code for interactive components. Put this in the head
   of the HTML layout.
3. `uswds-init.js`: Tiny script to prevent a flash of un-styled content while
   the rest of the JavaScript is loading. Put this at the bottom of the HTML
   body.

You can load these files from a JavaScript CDN like (i.e.
[JSDelivr](https://www.jsdelivr.com/package/npm/uswds),
[JSPM](https://jspm.org), or [UNPKG](https://unpkg.com)), download them directly
from the [NPM registry](https://www.npmjs.com/package/uswds), or use Yarn or NPM
to install the node package and build the files yourself.

Example [application layout.](https://github.com/TalariaSoftware/uswds_components/blob/main/spec/dummy/app/views/layouts/application.html.haml)

### Ruby gem

Add this line to your application's Gemfile:

```ruby
gem 'uswds_components'
```

Then run `bundle`.

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

Then start the app and access the resulting previews at:
http://localhost:3000/rails/view_components.

## Contributing

This project is intended to be a safe, welcoming space for collaboration.
Contributors are expected to adhere to the Contributor Covenant [code of
conduct.](/CODE_OF_CONDUCT.md)

## License

The gem is available as open source under the terms of the [Hippocratic License
3.0](https://firstdonoharm.dev).

## Prior art

Other design systems implemented with ViewComponents:

- [Primer ViewComponents](https://primer.style/view-components/) (used at
    GitHub)
- [GOV.UK Rails Components](https://govuk-components.netlify.app/) (for the UK
    government)
- [Polaris ViewComponents](https://github.com/baoagency/polaris_view_components)
    (used at Shopify)
