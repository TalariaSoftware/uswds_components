require 'rails_helper'

# https://designsystem.digital.gov/components/breadcrumb/
RSpec.describe UswdsComponents::BreadcrumbComponent, type: :component do
  subject(:component) { described_class.new }

  def render_component
    render_inline(component) do |trail|
      trail.crumb(href: '#home', name: 'Home')
      trail.crumb(href: '#feds', name: 'Feds')
    end
  end

  it "has an ordered list inside a nav" do
    render_component
    expect(page).to have_selector('nav ol')
  end

  it "is a breadcrumb" do
    render_component
    expect(page).to have_css('nav.usa-breadcrumb')
  end

  context "when is a wrapping breadcrumb" do
    subject(:component) { described_class.new wrap: true }

    it "is a wrapping breadcrumb" do
      render_component
      expect(page).to have_css('.usa-breadcrumb.usa-breadcrumb--wrap')
    end
  end

  it "is aria labeled" do
    render_component
    expect(page).to have_css('nav[aria-label=Breadcrumb]')
  end

  it "is a breadcrumb list" do
    render_component
    expect(page).to have_css('ol.usa-breadcrumb__list')
  end

  describe UswdsComponents::BreadcrumbComponent::Crumb, type: :component do
    subject(:component) do
      UswdsComponents::BreadcrumbComponent::Crumb.new(name: 'Hello', href: '/fake/path')
    end

    def render_component
      render_inline(component)
    end

    it "has a list item with a link and span inside" do
      render_component
      expect(page).to have_selector('li a span')
    end

    it "has a link to the content" do
      render_component
      expect(page).to have_link("Hello", href: '/fake/path')
    end

    it "has a breadcrumb list item" do
      render_component
      expect(page).to have_css('li.usa-breadcrumb__list-item')
    end

    it "has a breadcrumb link" do
      render_component
      expect(page).to have_css('a.usa-breadcrumb__link')
    end

    context "when the link is not to the current page" do
      before do
        allow(request).to receive(:path).and_return('/other/path')
      end

      it "is not the current list item" do
        render_component
        expect(page).to have_no_css('.usa-current')
      end
    end

    context "when the link is to the current page" do
      before do
        allow(request).to receive(:path).and_return('/fake/path')
      end

      it "has a list item with a span inside (no link)" do
        render_component
        expect(page).to have_selector('li span')
      end

      it "is the current list item" do
        render_component
        expect(page).to have_css('li.usa-current')
      end

      it "doesn't have a link" do
        render_component
        expect(page).to have_no_link
      end
    end
  end
end
