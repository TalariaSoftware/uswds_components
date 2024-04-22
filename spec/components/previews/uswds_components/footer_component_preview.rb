class UswdsComponents::FooterComponentPreview < ViewComponent::Preview
  def slim_footer
    render UswdsComponents::FooterComponent::SlimFooter.new do |footer|
      footer.with_logo(name: 'Name of Agency',
        src: 'https://cdn.jsdelivr.net/npm/uswds@2.12.1/src/img/correct8.svg')
      footer.with_primary_link(href: '#', name: 'Primary Link')
      footer.with_primary_link(href: '#', name: 'Primary Link')
      footer.with_primary_link(href: '#', name: 'Primary Link')

      footer.with_contact_link(href: 'tel:1-800-555-5555', name: '(800) CALL-GOVT')
      footer.with_contact_link(href: 'mailto:info@agency.gov', name: 'info@agency.gov')
    end
  end
end
