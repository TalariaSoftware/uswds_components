class UswdsComponents::BasicHeaderComponentPreview < ViewComponent::Preview
  def default
    render UswdsComponents::BasicHeaderComponent.new(
      image_path: 'https://cdn.jsdelivr.net/npm/uswds@2.13.0/dist/img',
    ) do |header|
      header.logo(href: '#', title: 'Project Title')

      header.primary_item(title: 'Current Section', current: true) do |item|
        item.submenu_item(href: '', name: 'Navigation link')
        item.submenu_item(href: '', name: 'Navigation link')
        item.submenu_item(href: '', name: 'Navigation link')
      end

      header.primary_item(title: 'Section') do |item|
        item.submenu_item(href: '', name: 'Navigation link')
        item.submenu_item(href: '', name: 'Navigation link')
        item.submenu_item(href: '', name: 'Navigation link')
      end

      header.primary_item(href: '#', title: 'Simple link')

      raw('<form class="usa-search usa-search--small" role="search">
        <label class="usa-sr-only" for="basic-search-field-en-small">
          Search
        </label>
        <input
          class="usa-input"
          id="basic-search-field-en-small"
          type="search"
          name="search"
        />
        <button class="usa-button" type="submit">
          <img
            src="https://cdn.jsdelivr.net/npm/uswds@2.13.0/dist/img/usa-icons-bg/search--white.svg"
            class="usa-search__submit-icon"
            alt="Search"
          />
        </button>
      </form>')
    end
  end

  def with_button
    render UswdsComponents::BasicHeaderComponent.new(
      image_path: 'https://cdn.jsdelivr.net/npm/uswds@2.13.0/dist/img',
    ) do |header|
      header.logo(href: '#', title: 'Project Title')

      header.primary_item(title: 'Current Section', current: true) do |item|
        item.submenu_item(href: '', name: 'Navigation link')
        item.submenu_item(href: '', name: 'Navigation link')
        item.submenu_item(href: '', name: 'Navigation link')
      end

      header.primary_item(href: '#', title: 'Simple link')

      header.primary_item do
        raw('
          <form>
            <button class="width-full">
              Sign out
            </button>
          </form>
        ')
      end
    end
  end
end
