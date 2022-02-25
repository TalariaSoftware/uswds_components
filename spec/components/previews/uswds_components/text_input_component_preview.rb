class UswdsComponents::TextInputComponentPreview < ViewComponent::Preview
  class Article
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :title, :body

    validates :title, presence: true
    validates :body, presence: true
  end

  def default
  end

  def with_hint
  end

  def with_errors
  end

  def with_options
  end

  def with_success
  end
end
