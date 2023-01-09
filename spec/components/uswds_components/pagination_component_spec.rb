require 'rails_helper'

# https://designsystem.digital.gov/components/pagination/
RSpec.describe UswdsComponents::PaginationComponent, type: :component do
  subject(:component) { described_class.new }

  it "is a pagination nav component" do
    render_inline(component)
    expect(page).to have_selector('nav.usa-pagination[aria-label="Pagination"]')
  end

  it "contains a pagination list" do
    render_inline(component)
    expect(page).to have_selector('nav ul.usa-pagination__list')
  end

  it "include the content" do
    render_inline(component) do
      "Hello world"
    end
    expect(page).to have_content("Hello world")
  end

  describe UswdsComponents::PaginationComponent::Previous do
    subject(:component) { described_class.new(url: '/previous') }

    before { render_inline(component) }

    it "is a pagination arrow" do
      expect(page)
        .to have_selector('li.usa-pagination__item.usa-pagination__arrow')
    end

    it "has a link to the previous page" do
      expect(page).to have_link("Previous", href: '/previous')
    end

    it "has the previous page classes" do
      expect(page).to have_selector(
        'a.usa-pagination__link.usa-pagination__previous-page',
      )
    end

    it "is labeled as previous page" do
      expect(page).to have_selector('a[aria-label="Previous page"]')
    end
  end

  describe UswdsComponents::PaginationComponent::Next do
    subject(:component) { described_class.new(url: '/next') }

    before { render_inline(component) }

    it "is a pagination arrow" do
      expect(page)
        .to have_selector('li.usa-pagination__item.usa-pagination__arrow')
    end

    it "has a link to the next page" do
      expect(page).to have_link("Next", href: '/next')
    end

    it "has the previous page classes" do
      expect(page).to have_selector(
        'a.usa-pagination__link.usa-pagination__next-page',
      )
    end

    it "is labeled as next page" do
      expect(page).to have_selector('a[aria-label="Next page"]')
    end
  end

  describe UswdsComponents::PaginationComponent::Page do
    subject(:component) do
      described_class.new(url: '/page', index: 7)
    end

    before { render_inline(component) }

    it "is a page number item" do
      expect(page)
        .to have_selector('li.usa-pagination__item.usa-pagination__page-no')
    end

    it "has a pagination button" do
      expect(page).to have_selector('a.usa-pagination__button')
    end

    it "links the given url" do
      expect(page).to have_link('7', href: '/page')
    end

    context "when the page is not the current page" do
      subject(:component) do
        described_class.new(url: '', index: 1, current: false)
      end

      it "does not have the current class" do
        expect(page)
          .not_to have_selector('a.usa-pagination__button.usa-current')
      end

      it "does not have the ARIA current attribute" do
        expect(page).not_to have_selector('a[aria-current="page"]')
      end
    end

    context "when the page is the current page" do
      subject(:component) do
        described_class.new(url: '', index: 1, current: true)
      end

      it "has the current class" do
        expect(page).to have_selector('a.usa-pagination__button.usa-current')
      end

      it "has the ARIA current attribute" do
        expect(page).to have_selector('a[aria-current="page"]')
      end
    end

    context "when the page is not the last page" do
      subject(:component) do
        described_class.new(url: '', index: 7, last: false)
      end

      it "has an ARIA label with the page number" do
        expect(page).to have_selector('a[aria-label="Page 7"]')
      end
    end

    context "when the page is the last page" do
      subject(:component) do
        described_class.new(url: '', index: 7, last: true)
      end

      it "has an ARIA label saying it's the last page" do
        expect(page).to have_selector('a[aria-label="Last page, page 7"]')
      end
    end
  end

  describe UswdsComponents::PaginationComponent::Overflow do
    subject(:component) { described_class.new }

    before { render_inline(component) }

    it "is a pagination overflow" do
      expect(page)
        .to have_selector('li.usa-pagination__item.usa-pagination__overflow')
    end

    it "has a presentation role" do
      expect(page).to have_selector('li[role="presentation"]')
    end

    it "has an ellipsis" do
      expect(page).to have_content("…")
    end
  end
end
