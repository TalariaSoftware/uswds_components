class BreadcrumbComponentPreview < ViewComponent::Preview
  def default
    render UswdsComponents::BreadcrumbComponent.new do |trail|
      trail.crumb(href: '#home', name: 'Home')
      trail.crumb(href: '#contracting', name: 'Federal Contracting')
      trail.crumb(href: '#assistance', name: 'Contracting assistance programs')
      trail.crumb(
        href: '/rails/view_components/uswds/breadcrumb_component/default',
        name: 'Women-owned small business federal contracting program',
      )
    end
  end

  def wrapping
    render UswdsComponents::BreadcrumbComponent.new(wrap: true) do |trail|
      trail.crumb(href: '#home', name: 'Home')
      trail.crumb(href: '#contracting', name: 'Federal Contracting')
      trail.crumb(href: '#assistance', name: 'Contracting assistance programs')
      trail.crumb(
        href: '/rails/view_components/uswds/breadcrumb_component/wrapping',
        name: 'Women-owned small business federal contracting program',
      )
    end
  end
end
