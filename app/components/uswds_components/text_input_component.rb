module UswdsComponents
  class TextInputComponent < ViewComponent::Base
    attr_accessor :form, :attribute, :input_options

    delegate :present?, to: :errors, prefix: true

    def initialize(form:, attribute:, input_options: {}, success: false)
      super
      @form = form
      @attribute = attribute
      @input_options = input_options

      input_options['class'] = ['usa-input']
      input_options['class'] << 'usa-input--error' if errors_present?
      input_options['class'] << 'usa-input--success' if success
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
