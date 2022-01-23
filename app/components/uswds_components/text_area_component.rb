module UswdsComponents
  class TextAreaComponent < ViewComponent::Base
    attr_accessor :form, :attribute, :input_options

    delegate :present?, to: :errors, prefix: true

    def initialize(form:, attribute:, input_options: {})
      super
      @form = form
      @attribute = attribute
      @input_options = input_options

      input_options['class'] = ['usa-textarea']
      input_options['class'] << 'usa-textarea--error' if errors_present?
    end

    def errors
      form.object.errors.where(attribute)
    end

    def label_classes
      if errors_present?
        ['usa-label', 'usa-label--error']
      else
        ['usa-label']
      end
    end
  end
end
