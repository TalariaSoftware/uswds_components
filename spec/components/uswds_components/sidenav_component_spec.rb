require 'rails_helper'

# https://designsystem.digital.gov/components/sidenav/
RSpec.describe UswdsComponents::SidenavComponent, type: :component do
  subject(:component) { described_class.new }

  def render_component
    render_inline(component) do |nav|
      nav.with_item href: '/path', name: 'an item'
    end
  end

  it "is a secondary navigation" do
    render_component
    expect(page).to have_css('nav[aria-label="Secondary navigation"]')
  end

  it "has an unordered list inside a nav" do
    render_component
    expect(page).to have_css('nav ul')
  end

  it "has a sidenav list" do
    render_component
    expect(page).to have_css('ul.usa-sidenav')
  end

  it "includes the list content" do
    render_component
    expect(page.find('ul li')).to have_content('an item')
  end

  describe UswdsComponents::SidenavComponent::Item, type: :component do
    subject(:component) do
      described_class.new(name: 'Hello', href: '/fake/path')
    end

    def render_component
      render_inline(component)
    end

    it "has a sidenav list item" do
      render_component
      expect(page).to have_css('li.usa-sidenav__item')
    end

    it "has a link to the content" do
      render_component
      expect(page).to have_link("Hello", href: '/fake/path')
    end

    context "when the link is not to the current page" do
      before do
        allow(component) # rubocop:disable RSpec/SubjectStub
          .to receive(:current_page?).with('/fake/path')
          .and_return(false)
      end

      it "is not the current list item" do
        render_component
        expect(page).to have_no_css('.usa-current')
      end
    end

    context "when the link is to the current page" do
      before do
        allow(component) # rubocop:disable RSpec/SubjectStub
          .to receive(:current_page?).with('/fake/path')
          .and_return(true)
      end

      it "is the current list item" do
        render_component
        expect(page).to have_link(class: 'usa-current')
      end
    end
  end
end
