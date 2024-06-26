class UswdsComponents::BreadcrumbComponentPreview < ViewComponent::Preview
  # Breadcrumb Component
  # --------------------
  #
  # [See at USWDS](https://designsystem.digital.gov/components/breadcrumb/)
  #
  # @param wrap toggle
  def default(wrap: false)
    render UswdsComponents::BreadcrumbComponent.new(wrap: wrap) do |trail|
      trail.with_crumb(href: '#home', name: 'Home')
      trail.with_crumb(href: '#contracting', name: 'Federal Contracting')
      trail.with_crumb(href: '#assistance', name: 'Contracting assistance programs')
      trail.with_crumb(
        href: '/lookbook/preview/uswds_components/breadcrumb/default',
        name: 'Women-owned small business federal contracting program',
      )
    end
  end

  # Breadcrumb Component
  # --------------------
  #
  # [See at USWDS](https://designsystem.digital.gov/components/breadcrumb/)
  #
  # @param wrap toggle
  def blank_paths(wrap: false)
    render UswdsComponents::BreadcrumbComponent.new(wrap: wrap) do |trail|
      trail.with_crumb(href: '#home', name: 'Home')
      trail.with_crumb(href: '', name: 'Federal Contracting')
      trail.with_crumb(href: '', name: 'Contracting assistance programs')
      trail.with_crumb(
        href: '/lookbook/preview/uswds_components/breadcrumb/blank_paths',
        name: 'Women-owned small business federal contracting program',
      )
    end
  end
end
