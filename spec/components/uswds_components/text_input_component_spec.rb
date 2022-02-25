require 'rails_helper'

# https://designsystem.digital.gov/components/text-input/
RSpec.describe UswdsComponents::TextInputComponent, type: :component do
  subject(:component) do
    described_class.new form: form, attribute: :title
  end

  let(:form) do
    ActionView::Helpers::FormBuilder.new('Article', object, nil, {})
  end
  let(:object) { article_class.new }
  let(:article_class) do
    Class.new do
      include ActiveModel::Model
      include ActiveModel::Validations

      attr_accessor :title, :body

      validates :title, presence: true
      validates :body, presence: true
    end
  end

  let(:input_classes) { component.input_options['class'] }

  def render_component
    render_inline(component)
  end

  describe "#errors_present?" do
    context "when the object does not have errors" do
      let(:object) { article_class.new }

      specify { expect(component).not_to be_errors_present }
    end

    context "when the object has errors on the field" do
      let(:object) { article_class.new.tap(&:valid?) }

      specify { expect(component).to be_errors_present }
    end

    context "when the object has errors on a different attribute" do
      let(:object) { article_class.new(title: 'Mr', body: '').tap(&:valid?) }

      specify { expect(component).not_to be_errors_present }
    end
  end

  describe "#label_classes" do
    subject(:label_classes) { component.label_classes }

    context "when the object does not have errors" do
      let(:object) { article_class.new }

      it { is_expected.to match_array(['usa-label']) }
    end

    context "when the object has errors on the field" do
      let(:object) { article_class.new.tap(&:valid?) }

      it { is_expected.to match_array(['usa-label', 'usa-label--error']) }
    end
  end

  describe "input classes" do
    subject(:input_classes) { component.input_options['class'] }

    let(:object) { article_class.new }

    it { is_expected.to match_array(['usa-input']) }

    context "when the object has errors on the field" do
      let(:object) { article_class.new.tap(&:valid?) }

      it { is_expected.to match_array(['usa-input', 'usa-input--error']) }
    end

    context "with the success option" do
      let(:component) do
        described_class.new form: form, attribute: :title, success: true
      end

      it { is_expected.to match_array(['usa-input', 'usa-input--success']) }
    end
  end

  describe "#hint" do
    subject { component.hint }

    context "when no hint is given" do
      let(:component) do
        described_class.new form: form, attribute: :title
      end

      it { is_expected.to be_blank }
    end

    context "when a hint is given" do
      let(:component) do
        described_class.new form: form, attribute: :title, hint: 'plastics'
      end

      it { is_expected.to eq('plastics') }
    end
  end
end
