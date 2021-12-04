require 'rails_helper'

# https://designsystem.digital.gov/components/collection/
RSpec.describe UswdsComponents::CollectionComponent, type: :component do
  subject(:component) { described_class.new }

  let(:expected_html) do
    <<~HTML
      <ul class="usa-collection">
        <li class="usa-collection__item">
          <div class="usa-collection__body">
            <h3 class="usa-collection__heading">
              <a class="usa-link" href="/">News</a>
            </h3>
            <p class="usa-collection__description">From France</p>
          </div>
        </li>
      </ul>
    HTML
  end

  def render_component
    render_inline(component) do |_collection|
      component.item(href: '/') do |item|
        item.header { 'News' }
        'From France'
      end
    end
  end

  it "matches the html" do
    render_component
    expect(rendered_component).to match_html_fragment(expected_html)
  end

  describe UswdsComponents::CollectionComponent::Item do
    def render_component
      render_inline(component) do |item|
        item.header { "Daily News" }
        "For some doll"
      end
    end

    context "without a datetime" do
      subject(:component) do
        described_class.new(href: '/path/to/resource')
      end

      let(:expected_html) do
        <<~HTML
          <li class="usa-collection__item">
            <div class="usa-collection__body">
              <h3 class="usa-collection__heading">
                <a class="usa-link" href="/path/to/resource">Daily News</a>
              </h3>
              <p class="usa-collection__description">For some doll</p>
            </div>
          </li>
        HTML
      end

      it "matches the html" do
        render_component
        expect(rendered_component).to match_html_fragment(expected_html)
      end
    end

    context "with a datetime" do
      subject(:component) do
        described_class.new(datetime: 'Apr 1, 2021', href: '#foo')
      end

      # The USWDS source uses a div with an href attribute for inexplicable
      # reasons. https://github.com/uswds/uswds/blob/develop/src/components/collection/collection--fancy-date.njk#L3
      let(:expected_html) do
        <<~HTML
          <li class="usa-collection__item">
            <div class="usa-collection__calendar-date" href="#foo">
              <time datetime="2021-04-01T00:00:00+00:00">
                <span class="usa-collection__calendar-date-month">APR</span>
                <span class="usa-collection__calendar-date-day">1</span>
              </time>
            </div>
            <div class="usa-collection__body">
              <h3 class="usa-collection__heading">
                <a class="usa-link" href="#foo">Daily News</a>
              </h3>
              <p class="usa-collection__description">For some doll</p>
            </div>
          </li>
        HTML
      end

      it "matches the html" do
        render_component
        expect(rendered_component).to match_html_fragment(expected_html)
      end
    end

    describe '#datetime' do
      subject(:datetime) { component.datetime }

      let(:component) { described_class.new(datetime: given_datetime) }

      context 'when given a datetime' do
        let(:given_datetime) { DateTime.new }

        it { is_expected.to eq(given_datetime) }
      end

      context 'when given a time' do
        let(:given_datetime) { Time.zone.now }

        it { is_expected.to eq(given_datetime) }
      end

      context 'when given a date string' do
        let(:given_datetime) { 'Apr 1, 2021' }

        it { is_expected.to eq(DateTime.parse('2021-04-01')) }
      end

      context 'when given an invalid date string' do
        let(:given_datetime) { 'never' }

        it { is_expected.to be_nil }
      end

      context 'when given nil' do
        let(:given_datetime) { nil }

        it { is_expected.to be_nil }
      end
    end
  end
end
