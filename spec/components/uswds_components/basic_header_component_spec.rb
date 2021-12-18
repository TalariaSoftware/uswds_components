require 'rails_helper'

# https://designsystem.digital.gov/components/header/
RSpec.describe UswdsComponents::BasicHeaderComponent, type: :component do
  subject(:component) { described_class.new }

  def render_component
    render_inline(component) do
      "the content".html_safe
    end
  end

  describe '#close_image' do
    subject(:close_image) { component.close_image }

    context 'when the image path is not given' do
      let(:component) { described_class.new }

      it { is_expected.to eq('/assets/img/usa-icons/close.svg') }
    end

    context 'when the image path is given' do
      let(:component) { described_class.new image_path: '/public/uswds/images' }

      it { is_expected.to eq('/public/uswds/images/usa-icons/close.svg') }
    end
  end

  describe UswdsComponents::BasicHeaderComponent::PrimaryItem,
    type: :component do
    let(:component) { described_class.new(title: "Help", href: '/help') }

    describe '#submenu_id' do
      let(:other_component) do
        described_class.new(title: "Help", href: '/help')
      end

      it "is intelligible" do
        expect(component.submenu_id).to start_with('usa-nav__submenu')
      end

      it "is different for different components" do
        expect(component.submenu_id).not_to eq(other_component.submenu_id)
      end
    end

    describe '#href' do
      subject(:href) { component.href }

      context "when given" do
        let(:component) { described_class.new(href: '/given_value') }

        it { is_expected.to eq('/given_value') }
      end

      context "when not given" do
        let(:component) { described_class.new }

        it { is_expected.to be_blank }
      end
    end

    describe '#current?' do
      before { render_inline(component) }

      context "when current is set to true" do
        let(:component) { described_class.new(current: true, href: '/ignored') }

        it { is_expected.to be_current }
      end

      context "when current is not assigned" do
        let(:component) { described_class.new(href: '/link_path') }

        context 'when the link points to the current page' do
          before do
            allow_any_instance_of(ActionView::Helpers::UrlHelper) # rubocop:disable RSpec/AnyInstance
              .to receive(:current_page?).with('/link_path').and_return(true)
          end

          it { is_expected.to be_current }
        end

        context 'when the link does not point to the current page' do
          before do
            allow_any_instance_of(ActionView::Helpers::UrlHelper) # rubocop:disable RSpec/AnyInstance
              .to receive(:current_page?).with('/link_path').and_return(false)
          end

          it { is_expected.not_to be_current }
        end

        context 'when the link is blank' do
          let(:component) { described_class.new(href: '') }

          it { is_expected.not_to be_current }
        end
      end
    end
  end
end
