class UswdsComponents::TextAreaComponentPreview < ViewComponent::Preview
  class Article
    include ActiveModel::Model

    attr_accessor :body
  end

  # Text Area Component
  # --------------------
  #
  # [See at USWDS](https://designsystem.digital.gov/components/text-input/)
  #
  # The Text Area Component is designed for a text area field in a form backed
  # by an ActiveModel object. In the preview example that is the `body`
  # attribute of an `Article` object.
  #
  # The preview allows you to set error
  # [messages](https://guides.rubyonrails.org/active_record_validations.html#errors-where-and-error-object)
  # on the title attribute. But the component displays the [full
  # message](https://api.rubyonrails.org/v7.0.3.1/classes/ActiveModel/Errors.html#method-i-full_message)
  # of the errors. That is why the attribute name is prepended.
  #
  # @param value
  # @param error1
  # @param error2
  def default(hint: '', value: '', success: nil, error1: '', error2: '')
  end

  def with_options
  end
end
