require 'rails_helper'

#
# https://designsystem.digital.gov/components/alert/
# heading: default '' An alert with no heading is a "slim" alert
# status: default 'info', options: info, warning, error, success
# icon: default true
RSpec.describe UswdsComponents::AlertComponent, type: :component do
  subject(:component) { described_class.new }

  def render_component
    render_inline(component) do
      "Check six"
    end
  end

  class MatchHtmlFragment
    attr_accessor :failure_message

    def initialize(expected_html)
      @expected_fragment =
        Nokogiri::HTML::DocumentFragment.parse(expected_html.chomp)
      @failure_message = ''
    end

    def matches?(actual_html)
      actual_fragment =
        Nokogiri::HTML::DocumentFragment.parse(actual_html.chomp)

      equal_nodes? @expected_fragment, actual_fragment
    end

    def description
      "match fragment starting with #{@expected_fragment.to_s.lines.first}"
    end

    private

    def equal_nodes?(expected, actual) # rubocop:disable Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
      return false unless expected.instance_of?(actual.class)
      return false unless equal_names?(expected, actual)
      return false unless no_extra_attributes?(expected, actual)
      return false unless no_missing_attributes?(expected, actual)
      return false unless equal_attributes?(expected, actual)
      return false unless equal_content?(expected, actual)
      return false unless equal_child_count?(expected, actual)
      return false unless equal_children?(expected, actual)

      true
    end

    def equal_classes?(expected, actual)
      return true if expected.instance_of?(actual.class)

      fail "Expected #{actual.class} to be a #{expected.class}.", expected
    end

    def equal_names?(expected, actual)
      return true unless expected.is_a?(Nokogiri::XML::Element)

      return true if expected.name == actual.name

      fail "Expected tag #{actual.name} to be a #{expected.name}.", expected
    end

    def no_extra_attributes?(expected, actual)
      extra_attributes = actual.attributes.keys - expected.attributes.keys
      return true if extra_attributes.empty?

      fail("Unexpected attributes #{extra_attributes}", expected)
    end

    def no_missing_attributes?(expected, actual)
      missing_attributes = expected.attributes.keys - actual.attributes.keys
      return true if missing_attributes.empty?

      fail("Missing attributes #{missing_attributes}", expected)
    end

    def equal_attributes?(expected, actual)
      expected.attributes.each_key do |key|
        if expected.attributes[key].value != actual.attributes[key].value
          return fail(
            "Expected #{key} to be '#{expected.attributes[key].value}. "\
              "Got '#{actual.attributes[key].value}' instead.",
            expected,
          )
        end
      end

      true
    end

    def equal_content?(expected, actual)
      return true unless expected.is_a? Nokogiri::XML::Text

      expected_content = expected.content.strip.gsub(/\s+/, ' ')
      actual_content = actual.content.strip.gsub(/\s+/, ' ')

      return true if expected_content.strip == actual_content.strip

      fail(
        "Expected content '#{expected_content}'. "\
          "Got '#{actual_content}' instead.",
        expected,
      )
    end

    def equal_child_count?(expected, actual)
      expected_count = expected.children.count(&:present?)
      actual_count = actual.children.count(&:present?)

      return true if expected_count == actual_count

      fail(
        "Expected #{expected_count} children. "\
          "Got #{actual_count} instead.",
        expected,
      )
    end

    def equal_children?(expected, actual)
      expected_children = expected.children.reject(&:blank?)
      actual_children = actual.children.reject(&:blank?)

      expected_children.each_with_index do |expected_child, i|
        return false unless equal_nodes?(expected_child, actual_children[i])
      end
    end

    def fail(message, node)
      @failure_message = message
      @failure_message += " (at #{node.css_path})"
      false
    end
  end

# RSpec.configure do |config|
#   config.include MatchHtmlFragment
# end


  def match_html_fragment(html)
    MatchHtmlFragment.new(html)
  end

  info_alert = <<~HTML
    <div class="usa-alert usa-alert--info usa-alert--slim" >
      <div class="usa-alert__body">
        <p class="usa-alert__text">
          Check six
        </p>
      </div>
    </div>
  HTML

  it "matches the html" do
    render_component
    expect(rendered_component).to match_html_fragment(info_alert)
  end

  it "is an alert" do
    render_component
    expect(page).to have_selector('div.usa-alert')
  end

  it "has a body" do
    render_component
    expect(page).to have_selector('.usa-alert div.usa-alert__body')
  end

  it "includes the content" do
    render_component
    expect(page.find('p.usa-alert__text')).to have_content("Check six")
  end

  describe "heading option" do
    context "when no heading is given" do
      subject(:component) { described_class.new heading: "" }

      it "is a slim alert" do
        render_component
        expect(page).to have_selector('.usa-alert.usa-alert--slim')
      end

      it "does not include a heading" do
        render_component
        expect(page).to have_no_selector('.usa-alert__heading')
      end
    end

    context "when a heading is given" do
      subject(:component) { described_class.new heading: "Look" }

      it "includes the heading" do
        render_component
        expect(page)
          .to have_selector('.usa-alert .usa-alert__body h3.usa-alert__heading')
      end

      it "includes the heading text" do
        render_component
        expect(page.find('.usa-alert__heading')).to have_content("Look")
      end
    end
  end

  describe "status option" do
    context "when no status is given" do
      subject(:component) { described_class.new status: '' }

      it "is an info alert" do
        render_component
        expect(page).to have_selector('.usa-alert.usa-alert--info')
      end
    end

    context "when the status is info" do
      subject(:component) { described_class.new status: 'info' }

      it "is an info alert" do
        render_component
        expect(page).to have_selector('.usa-alert.usa-alert--info')
      end
    end

    context "when the status is warning" do
      subject(:component) { described_class.new status: 'warning' }

      it "is an warning alert" do
        render_component
        expect(page).to have_selector('.usa-alert.usa-alert--warning')
      end
    end

    context "when the status is error" do
      subject(:component) { described_class.new status: 'error' }

      it "is an error alert" do
        render_component
        expect(page).to have_selector('.usa-alert.usa-alert--error')
      end
    end

    context "when the status is success" do
      subject(:component) { described_class.new status: 'success' }

      it "is an success alert" do
        render_component
        expect(page).to have_selector('.usa-alert.usa-alert--success')
      end
    end
  end

  describe "icon option" do
    context "when the icon option is not set" do
      subject(:component) { described_class.new }

      it "includes an icon" do
        render_component
        expect(page).to have_no_selector('.usa-alert--no-icon')
      end
    end

    context "when the icon option is true" do
      subject(:component) { described_class.new include_icon: true }

      it "includes an icon" do
        render_component
        expect(page).to have_no_selector('.usa-alert--no-icon')
      end
    end

    context "when the icon option is false" do
      subject(:component) { described_class.new include_icon: false }

      it "does not include an icon" do
        render_component
        expect(page).to have_selector('.usa-alert.usa-alert--no-icon')
      end
    end
  end
end
