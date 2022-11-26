require 'rails_helper'

# https://designsystem.digital.gov/components/footer/

# Big footer
# - contact info list (href, name)
# - contact heading
# - Logo
#   - path
#   - name (of agency)
# - Social links
#   - social network (facebook, twitter, youtube, rss)
# - Secondary link list
#   - Topic
#   - secondary links (href, name)
# - Signup form
#   - heading ("Sign up")
#   - label ("Your email address")
#   - button text

# Medium footer
# - Primary link list (href, name)
# - contact info list (href, name)
# - contact heading
# - Logo
#   - path
#   - name (of agency)
# - Social links
#   - social network (facebook, twitter, youtube, rss)

# Slim footer
# - Primary link list (href, name)
# - contact info list (href, name)
# - Logo
#   - path
#   - name (of agency)

RSpec.describe UswdsComponents::FooterComponent, type: :component do
  describe UswdsComponents::FooterComponent::SlimFooter, type: :component do
    subject(:component) { described_class.new }

    def render_component
      render_inline(component) do |footer|
        footer.primary_link(href: '#', name: 'primary')
        footer.contact_link(href: '#', name: 'contact')
        footer.logo(src: '#', name: 'logo section')
      end
    end

    it "is a footer" do
      render_component
      expect(page).to have_selector('footer.usa-footer')
    end

    it "is a slim footer" do
      render_component
      expect(page).to have_selector('footer.usa-footer--slim')
    end

    # describe "return to top" do
    #   it "has a return to top section" do
    #     render_component
    #     expect(page).to have_selector('footer > div.usa-footer__return-to-top')
    #   end
    #
    #   it "is a grid" do
    #     render_component
    #     expect(page)
    #       .to have_selector('.usa-footer__return-to-top.grid-container')
    #   end
    #
    #   it "has a link" do
    #     render_component
    #     expect(page).to have_selector('.usa-footer__return-to-top a')
    #   end
    #
    #   it "links to the top" do
    #     render_component
    #     expect(page)
    #       .to have_selector('.usa-footer__return-to-top a[href="#what"]')
    #   end
    #
    #   it "says it links to the top" do
    #     render_component
    #     expect(page.find('.usa-footer__return-to-top a'))
    #       .to have_content('Return to top')
    #   end
    # end

    describe "primary section" do
      it "has a primary section" do
        render_component
        expect(page)
          .to have_selector('footer > div.usa-footer__primary-section')
      end

      it "has a primary container" do
        render_component
        expect(page).to have_selector(
          '.usa-footer__primary-section > .usa-footer__primary-container',
        )
      end

      it "has a container that is a grid row" do
        render_component
        expect(page).to have_selector('.usa-footer__primary-container.grid-row')
      end

      it "is eight columns wide" do
        render_component
        expect(page).to have_selector(
          '.usa-footer__primary-container > .mobile-lg\:grid-col-8',
        )
      end

      it "has a footer nav" do
        render_component
        expect(page).to have_selector(
          '.usa-footer__primary-container > .mobile-lg\:grid-col-8 ' \
            'nav.usa-footer__nav',
        )
      end

      it "has an aria label on the footer nav" do
        render_component
        expect(page).to have_selector(
          '.usa-footer__nav[aria-label="Footer navigation"]',
        )
      end

      it "has an unordered list in the nav" do
        render_component
        expect(page).to have_selector(
          '.usa-footer__nav > ul.grid-row.grid-gap',
        )
      end

      it "has the primary links in the list" do
        render_component
        expect(page.find('ul')).to have_content('primary')
      end
    end

    describe "address" do
      it "has a footer address" do
        render_component
        expect(page).to have_selector(
          '.usa-footer__primary-container div.mobile-lg\:grid-col-4 ' \
            'address.usa-footer__address',
        )
      end

      it "has a row in the address" do
        render_component
        expect(page).to have_selector(
          '.usa-footer__address > .grid-row.grid-gap',
        )
      end

      it "contact info in the row" do
        render_component
        expect(page.find('.usa-footer__address > .grid-row'))
          .to have_content('contact')
      end
    end

    describe "secondary section" do
      it "has a secondary section" do
        render_component
        expect(page).to have_selector(
          'footer > div.usa-footer__secondary-section',
        )
      end

      it "has a grid container" do
        render_component
        expect(page).to have_selector(
          '.usa-footer__secondary-section > div.grid-container',
        )
      end

      it "has the logo content" do
        render_component
        expect(page.find('.usa-footer__secondary-section > .grid-container'))
          .to have_content('logo section')
      end
    end
  end

  describe UswdsComponents::FooterComponent::Logo, type: :component do
    subject(:component) do
      described_class.new(
        src: '/fake/logo.png',
        name: 'Control',
      )
    end

    def render_component
      render_inline(component)
    end

    it "is a footer logo" do
      render_component
      expect(page).to have_selector('div.usa-footer__logo')
    end

    it "is a grid row" do
      render_component
      expect(page).to have_selector('.usa-footer__logo.grid-row')
    end

    it "has a 2 unit gap" do
      render_component
      expect(page).to have_selector('.usa-footer__logo.grid-gap-2')
    end

    it "contains two grid columns" do
      render_component
      expect(page)
        .to have_selector('.usa-footer__logo .grid-col-auto + .grid-col-auto')
    end

    it "contains a logo image" do
      render_component
      expect(page.first('.usa-footer__logo .grid-col-auto'))
        .to have_css('img.usa-footer__logo-img')
    end

    it "point to the image file" do
      render_component
      expect(page).to have_selector('img[src="/fake/logo.png"]')
    end

    it "has an empty alt attribute" do
      render_component
      expect(page).to have_selector('img[alt=""]')
    end

    it "contains a logo heading" do
      render_component
      expect(page.all('.usa-footer__logo .grid-col-auto').last)
        .to have_css('p.usa-footer__logo-heading')
    end

    it "has the name" do
      render_component
      expect(page.find('.usa-footer__logo-heading')).to have_content('Control')
    end

    context "when the logo src is blank" do
      subject(:component) do
        described_class.new(src: '', name: 'Control')
      end

      it "does not have multiple grid column" do
        render_component
        expect(page).not_to have_selector('.grid-col-auto + .grid-col-auto')
      end

      it "does not contain a logo image" do
        render_component
        expect(page).not_to have_css('img')
      end
    end
  end

  describe UswdsComponents::FooterComponent::PrimaryLink, type: :component do
    subject(:component) do
      described_class.new(
        href: '/fake/path',
        name: 'Page',
      )
    end

    def render_component
      render_inline(component)
    end

    it "is a primary content list item" do
      render_component
      expect(page)
        .to have_selector('li.usa-footer__primary-content')
    end

    it "is four columns wide on large mobile" do
      render_component
      expect(page)
        .to have_selector('.usa-footer__primary-content.mobile-lg\:grid-col-4')
    end

    it "is auto width on desktop" do
      render_component
      expect(page)
        .to have_selector('.usa-footer__primary-content.desktop\:grid-col-auto')
    end

    it "contains a primary link" do
      render_component
      expect(page).to have_selector('li a.usa-footer__primary-link')
    end

    it "has the href" do
      render_component
      expect(page).to have_link(href: '/fake/path')
    end

    it "has the name" do
      render_component
      expect(page.find('a')).to have_content('Pag')
    end
  end

  describe UswdsComponents::FooterComponent::ContactLink, type: :component do
    subject(:component) do
      described_class.new(
        href: 'tel:311',
        name: 'Call 311',
      )
    end

    def render_component
      render_inline(component)
    end

    it "is auto width" do
      render_component
      expect(page).to have_selector('div.grid-col-auto')
    end

    it "contains a link" do
      render_component
      expect(page).to have_selector('div a')
    end

    it "has the href" do
      render_component
      expect(page).to have_link(href: 'tel:311')
    end

    it "has the name" do
      render_component
      expect(page.find('a')).to have_content('Call 311')
    end
  end
end
