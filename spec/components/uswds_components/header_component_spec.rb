require 'rails_helper'

# https://designsystem.digital.gov/components/header/
RSpec.describe Uswds::HeaderComponent, type: :component do
  subject(:component) do
    described_class.new(
      logo_title: 'Fancy Site',
      logo_href: '/home',
      primary_items: [],
      menu_button_text: 'Menu',
      close_content: "<img src='close.svg'/>".html_safe,
    )
  end

  def render_component
    render_inline(component) do
      "the content".html_safe
    end
  end

  describe Uswds::HeaderComponent::Header do
    subject(:component) do
      described_class.new
    end

    it "is a header" do
      render_component
      expect(page).to have_selector('header.usa-header')
    end

    it "is a basic header" do
      render_component
      expect(page).to have_selector('.usa-header.usa-header--basic')
    end

    it "has a nav container in the header" do
      render_component
      expect(page).to have_selector('.usa-header div.usa-nav-container')
    end

    it "has content in the nav container" do
      render_component
      expect(page.find('.usa-nav-container')).to have_content("the content")
    end
  end

  describe Uswds::HeaderComponent::Navbar do
    subject(:component) do
      described_class.new
    end

    def render_component
      render_inline(component) do
        "content"
      end
    end

    it "has a navbar" do
      render_component
      expect(page).to have_selector('div.usa-navbar')
    end

    it "has the navbar content" do
      render_component
      expect(page.find('.usa-navbar')).to have_content("content")
    end
  end

  describe Uswds::HeaderComponent::Logo do
    subject(:component) do
      described_class.new(
        title: "Fancy Site",
        href: '/home',
      )
    end

    def render_component
      render_inline(component)
    end

    it "has a logo" do
      render_component
      expect(page).to have_selector('div.usa-logo')
    end

    it "has basic logo" do
      render_component
      expect(page).to have_selector('.usa-logo#basic-logo')
    end

    it "has logo text" do
      render_component
      expect(page).to have_selector('.usa-logo .usa-logo__text')
    end

    it "has a link in the logo text" do
      render_component
      expect(page).to have_selector('.usa-logo__text a')
    end

    it "has a link titled 'Home'" do
      render_component
      expect(page).to have_selector('.usa-logo__text a[title="Home"]')
    end

    it "links to the home path" do
      render_component
      expect(page).to have_selector('.usa-logo__text a[href="/home"]')
    end

    it "has the title for link text" do
      render_component
      expect(page.find('.usa-logo__text a')).to have_content("Fancy Site")
    end
  end

  describe Uswds::HeaderComponent::MenuButton do
    subject(:component) do
      described_class.new
    end

    def render_component
      render_inline(component) do
        "Menu"
      end
    end

    it "has a menu button" do
      render_component
      expect(page).to have_selector('button.usa-menu-btn')
    end

    it "has the menu for button text" do
      render_component
      expect(page.find('.usa-menu-btn')).to have_content("Menu")
    end
  end

  describe Uswds::HeaderComponent::Nav do
    subject(:component) do
      described_class.new(
        close_content:
          '<img src="close.svg" role="img" alt="close"/>'.html_safe,
      )
    end

    def render_component
      render_inline(component) do
        "<ul class='primary'></ul>".html_safe
      end
    end

    it "has a nav tag" do
      render_component
      expect(page).to have_selector('nav.usa-nav')
    end

    it "has the primary navigation aria label" do
      render_component
      expect(page).to have_selector('.usa-nav[aria-label="Primary navigation"]')
    end

    it "has a close button" do
      render_component
      expect(page).to have_selector('.usa-nav button.usa-nav__close')
    end

    it "has the close image" do
      render_component
      expect(page).to have_selector('.usa-nav__close img[src="close.svg"]')
    end

    it "has the close image role" do
      render_component
      expect(page).to have_selector('img[role="img"]')
    end

    it "has the close image alt" do
      render_component
      expect(page).to have_selector('img[alt="close"]')
    end

    it "has a content after the close button" do
      render_component
      expect(page).to have_selector('button + ul.primary')
    end
  end

  describe Uswds::HeaderComponent::PrimaryList do
    subject(:component) do
      described_class.new
    end

    def render_component
      render_inline(component) do
        "<li>item</ul>".html_safe
      end
    end

    it "is a primary list" do
      render_component
      expect(page).to have_selector('ul.usa-nav__primary')
    end

    it "is an accordian" do
      render_component
      expect(page).to have_selector('ul.usa-accordion')
    end

    it "has the link content" do
      render_component
      expect(page.find('ul li')).to have_content("item")
    end
  end

  describe Uswds::HeaderComponent::PrimaryItem do
    subject(:component) do
      described_class.new
    end

    def render_component
      render_inline(component) do
        "Widget".html_safe
      end
    end

    it "is a primary list item" do
      render_component
      expect(page).to have_selector('li.usa-nav__primary-item')
    end

    it "has the link content" do
      render_component
      expect(page.find('li')).to have_content("Widget")
    end
  end

  describe Uswds::HeaderComponent::Link do
    subject(:component) do
      described_class.new(href: '/item/path', name: 'Hyrule')
    end

    def render_component
      render_inline(component)
    end

    it "has a link" do
      render_component
      expect(page).to have_selector('a.usa-nav__link')
    end

    it "points to the path" do
      render_component
      expect(page).to have_selector('a[href="/item/path"]')
    end

    it "has a span in the link" do
      render_component
      expect(page).to have_selector('a span')
    end

    it "has the link content" do
      render_component
      expect(page.find('a span')).to have_content("Hyrule")
    end
  end

  describe Uswds::HeaderComponent::Submenu do
    subject(:component) do
      described_class.new(
        title: "Map",
        items: [submenu_item],
      )
    end

    let(:submenu_item) do
      Uswds::HeaderComponent::SubmenuItem.new(
        href: '/submenu/path', name: 'submenu item',
      )
    end

    def render_component
      render_inline(component)
    end

    it "is has a button" do
      render_component
      expect(page).to have_selector('button')
    end

    it "button is an accordian" do
      render_component
      expect(page).to have_selector('button.usa-accordion__button')
    end

    it "button is a nav link" do
      render_component
      expect(page).to have_selector('button.usa-nav__link')
    end

    it "button is not expanded" do
      render_component
      expect(page).to have_selector('button[aria-expanded="false"]')
    end

    it "has the title in the submenu button" do
      render_component
      expect(page.find('button span')).to have_content("Map")
    end

    it "is has a list after the button" do
      render_component
      expect(page).to have_selector('button + ul')
    end

    it "is has a submenu list" do
      render_component
      expect(page).to have_selector('ul.usa-nav__submenu')
    end

    it "is has content in the submenu list" do
      render_component
      expect(page.find('.usa-nav__submenu li')).to have_content("submenu item")
    end

    it "has an id for the list" do
      render_component
      expect(page.find('ul')['id']).to be_present
    end

    it "sets the list id to the submenu id" do
      render_component
      expect(page.find('ul.usa-nav__submenu')['id']).to eq(component.submenu_id)
    end

    it "sets the button control to the submenu id" do
      render_component
      expect(page)
        .to have_selector("button[aria-controls='#{component.submenu_id}']")
    end

    describe "#submenu_id" do
      it "changes when the title changes" do
        expect {
          component.title = "Something new"
        }.to change { component.submenu_id }
      end
    end
  end

  describe Uswds::HeaderComponent::SubmenuItem do
    subject(:component) do
      described_class.new(href: '/submenu/path', name: 'submenu item')
    end

    def render_component
      render_inline(component)
    end

    it "is has a list item" do
      render_component
      expect(page).to have_selector('li')
    end

    it "list item is a submenu item" do
      render_component
      expect(page).to have_selector('li.usa-nav__submenu-item')
    end

    it "is has a link" do
      render_component
      expect(page).to have_selector('li a')
    end

    it "link point to the href" do
      render_component
      expect(page).to have_selector("a[href='/submenu/path']")
    end

    it "has the link content" do
      render_component
      expect(page.find('a')).to have_content("submenu item")
    end
  end
end
