class UswdsComponents::SearchComponentPreview < ViewComponent::Preview
  def default
    render UswdsComponents::SearchComponent.new(
      form_options: { method: :get },
      submit_icon: 'https://cdn.jsdelivr.net/npm/uswds@2.13.0/src/img/usa-icons-bg/search--white.svg',
    )
  end

  def big
    render UswdsComponents::SearchComponent.new(
      size: :big,
      form_options: { method: :get },
      submit_icon: 'https://cdn.jsdelivr.net/npm/uswds@2.13.0/src/img/usa-icons-bg/search--white.svg',
    )
  end

  def small
    render UswdsComponents::SearchComponent.new(
      size: :small,
      form_options: { method: :get },
      submit_icon: 'https://cdn.jsdelivr.net/npm/uswds@2.13.0/src/img/usa-icons-bg/search--white.svg',
    )
  end
end
