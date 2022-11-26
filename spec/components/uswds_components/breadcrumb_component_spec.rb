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
      described_class.new(name: 'Hello',
        href: '/fake/path')
    end

    def render_component
      render_inline(component)
    end

    describe '#current?' do
      subject(:component) do
        described_class.new(name: "Hello", href: component_path)
      end

      before do
        allow(request).to receive(:path).and_return(current_path)
        render_component
      end

      context "when the component matches the request path" do
        let(:current_path) { '/current/path' }
        let(:component_path) { '/current/path' }

        it { is_expected.to be_current }
      end

      context "when the component path does not match the request path" do
        let(:current_path) { '/current/path' }
        let(:component_path) { '/diff/path' }

        it { is_expected.not_to be_current }
      end

      context "when the component path is blank and current is root" do
        let(:current_path) { '/' }
        let(:component_path) { '' }

        it { is_expected.not_to be_current }
      end
    end

    describe '#linked?' do
      subject(:component) do
        described_class.new(name: "Hello", href: component_path)
      end

      let(:current_path) { '/current/path' }

      before do
        allow(request).to receive(:path).and_return(current_path)
        render_component
      end

      context "when it points to a differnt page" do
        let(:component_path) { '/diff/path' }

        it { is_expected.to be_linked }
      end

      context "when it points to the current page" do
        let(:component_path) { '/current/path' }

        it { is_expected.not_to be_linked }
      end

      context "when it points nowhere" do
        let(:component_path) { '' }

        it { is_expected.not_to be_linked }
      end
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
      expect(page).to have_link(class: 'usa-breadcrumb__link')
    end

    context "when the link is not to the current page" do
      before do
        allow(request).to receive(:path).and_return('/other/path')
      end

      it "is not the current list item" do
        render_component
        expect(page).not_to have_css('.usa-current')
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
        expect(page).not_to have_link
      end
    end

    context "when the link url is blank" do
      subject(:component) do
        described_class.new(name: 'Hello', href: '')
      end

      it "has a list item with a span inside (no link)" do
        render_component
        expect(page).to have_selector('li span')
      end

      it "doesn't have a link" do
        render_component
        expect(page).not_to have_link
      end
    end
  end
end
