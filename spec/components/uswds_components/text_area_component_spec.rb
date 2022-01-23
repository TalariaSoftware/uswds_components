require 'rails_helper'

# https://designsystem.digital.gov/components/text-input/
RSpec.describe UswdsComponents::TextAreaComponent, type: :component do
  subject(:component) do
    described_class.new form: form, attribute: attribute
  end

  let(:form) do
    ActionView::Helpers::FormBuilder.new('Article', object, nil, {})
  end
  let(:attribute) { :body }
  let(:object) { Article.new }
  let(:input_classes) { component.input_options['class'] }

  def render_component
    render_inline(component)
  end

  describe "#errors_present?" do
    context "when the object does not have errors" do
      let(:object) { Article.new }

      specify { expect(component).not_to be_errors_present }
    end

    context "when the object has errors on the field" do
      let(:object) { Article.new.tap(&:valid?) }

      specify { expect(component).to be_errors_present }
    end

    context "when the object has errors on a different attribute" do
      let(:object) { Article.new(title: '', body: 'Hello').tap(&:valid?) }

      specify { expect(component).not_to be_errors_present }
    end
  end

  describe "#label_classes" do
    subject(:label_classes) { component.label_classes }

    context "when the object does not have errors" do
      let(:object) { Article.new }

      it { is_expected.to match_array(['usa-label']) }
    end

    context "when the object has errors on the field" do
      let(:object) { Article.new.tap(&:valid?) }

      it { is_expected.to match_array(['usa-label', 'usa-label--error']) }
    end
  end

  describe "input classes" do
    subject(:input_classes) { component.input_options['class'] }

    let(:object) { Article.new }

    it { is_expected.to match_array(['usa-textarea']) }

    context "when the object has errors on the field" do
      let(:object) { Article.new.tap(&:valid?) }

      it { is_expected.to match_array(['usa-textarea', 'usa-textarea--error']) }
    end
  end
end
