require 'rails_helper'

# https://designsystem.digital.gov/components/search/
RSpec.describe UswdsComponents::SearchComponent, type: :component do
  subject(:component) { described_class.new }

  def render_component
    render_inline(component)
  end

  it "has a search button" do
    render_component
    expect(page).to have_button('Search')
  end

  describe '#form_options' do
    subject { component.form_options }

    let(:component) { described_class.new(form_options: { url: '/search' }) }

    it { is_expected.to eq({ url: '/search' }) }
  end

  describe '#query_field_id' do
    subject { component.query_field_id }

    context "when no field id is given" do
      it { is_expected.to eq(:query) }
    end

    context "when a field id is given" do
      let(:component) { described_class.new(query_field_id: :search_phrase) }

      it { is_expected.to eq(:search_phrase) }
    end
  end

  describe '#query_param' do
    subject { component.query_param }

    context "when no query param is given" do
      it { is_expected.to eq(:q) }
    end

    context "when a query param is given" do
      let(:component) { described_class.new(query_param: :query) }

      it { is_expected.to eq(:query) }
    end
  end

  describe '#submit_icon' do
    subject { component.submit_icon }

    context "when no icon is given" do
      it { is_expected.to eq('') }
    end

    context "when an icon is given" do
      let(:component) { described_class.new(submit_icon: '/search.png') }

      it { is_expected.to eq('/search.png') }
    end
  end

  describe '#size/small?/big?' do
    context "when no size is given" do
      subject(:component) { described_class.new }

      specify { expect(component.size).to eq(:default) }
      it { is_expected.not_to be_small }
      it { is_expected.not_to be_big }
    end

    context "when the component is small" do
      subject(:component) { described_class.new(size: :small) }

      specify { expect(component.size).to eq(:small) }
      it { is_expected.to be_small }
      it { is_expected.not_to be_big }
    end

    context "when the component is big" do
      subject(:component) { described_class.new(size: :big) }

      specify { expect(component.size).to eq(:big) }
      it { is_expected.not_to be_small }
      it { is_expected.to be_big }
    end
  end

  describe '#form_classes' do
    subject { component.form_classes }

    it { is_expected.to eq(['usa-search']) }

    context "when the component is small" do
      let(:component) { described_class.new(size: :small) }

      it { is_expected.to eq(['usa-search', 'usa-search--small']) }
    end

    context "when the component is big" do
      let(:component) { described_class.new(size: :big) }

      it { is_expected.to eq(['usa-search', 'usa-search--big']) }
    end
  end
end
