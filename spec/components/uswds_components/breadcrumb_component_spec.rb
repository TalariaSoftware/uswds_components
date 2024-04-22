require 'rails_helper'

# https://designsystem.digital.gov/components/breadcrumb/
RSpec.describe UswdsComponents::BreadcrumbComponent, type: :component do
  subject(:component) do
    described_class.new do |c|
      c.with_crumb(href: '#home', name: 'Home')
      c.with_crumb(href: '#feds', name: 'Feds')
    end
  end

  def render_component
    render_inline(component)
  end

  it "has an ordered list inside a nav" do
    render_component
    expect(page).to have_css('nav ol')
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

      let(:component_path) { '/component/path' }

      before do
        allow(component) # rubocop:disable RSpec/SubjectStub
          .to receive(:current_page?).with(component_path)
          .and_return(current_page)
      end

      context "when the URL helper says it is not the current page" do
        let(:current_page) { false }

        it { is_expected.not_to be_current }
      end

      context "when the URL helper says it is the current page" do
        let(:current_page) { true }

        it { is_expected.to be_current }

        context "when the component path is blank" do
          let(:component_path) { '' }

          it { is_expected.not_to be_current }
        end
      end
    end

    describe '#linked?' do
      subject(:component) do
        described_class.new(name: "Hello", href: component_path)
      end

      let(:component_path) { '/component_path/path' }

      before do
        allow(component) # rubocop:disable RSpec/SubjectStub
          .to receive(:current_page?).with(component_path)
          .and_return(current_page)
      end

      context "when it points to a different page" do
        let(:current_page) { false }

        it { is_expected.to be_linked }
      end

      context "when it points to the current page" do
        let(:current_page) { true }

        it { is_expected.not_to be_linked }
      end

      context "when it points nowhere" do
        let(:component_path) { '' }
        let(:current_page) { false }

        it { is_expected.not_to be_linked }
      end
    end

    it "has a list item with a link and span inside" do
      render_component
      expect(page).to have_css('li a span')
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

    describe "variations for current page" do
      subject(:component) do
        described_class.new(name: "Hello", href: component_path)
      end

      let(:component_path) { '/component_path/path' }

      before do
        allow(component) # rubocop:disable RSpec/SubjectStub
          .to receive(:current_page?).with(component_path)
          .and_return(current_page)
      end

      context "when the link is not to the current page" do
        let(:current_page) { false }

        it "is not the current list item" do
          render_component
          expect(page).to have_no_css('.usa-current')
        end
      end

      context "when the link is to the current page" do
        let(:current_page) { true }

        it "has a list item with a span inside (no link)" do
          render_component
          expect(page).to have_css('li span')
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

    context "when the link url is blank" do
      subject(:component) do
        described_class.new(name: 'Hello', href: '')
      end

      it "has a list item with a span inside (no link)" do
        render_component
        expect(page).to have_css('li span')
      end

      it "doesn't have a link" do
        render_component
        expect(page).to have_no_link
      end
    end
  end
end
