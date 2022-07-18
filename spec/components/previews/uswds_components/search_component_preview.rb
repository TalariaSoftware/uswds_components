class UswdsComponents::SearchComponentPreview < ViewComponent::Preview
  # Search Component
  # ----------------
  #
  # [See at USWDS](https://designsystem.digital.gov/components/search/)
  #
  # @param size [Symbol] select [[Default, nil], [Small, small], [Big, big]]
  def default(size: nil)
    render UswdsComponents::SearchComponent.new(
      size: size,
      form_options: { url: '#' },
      submit_icon: 'https://cdn.jsdelivr.net/npm/uswds@2.13.0/src/img/usa-icons-bg/search--white.svg',
    )
  end
end
