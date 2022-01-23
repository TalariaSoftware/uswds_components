class UswdsComponents::TextAreaComponentPreview < ViewComponent::Preview
  class Article
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :title, :body

    validates :title, presence: true
    validates :body, presence: true
  end

  def default
  end

  def with_errors
  end

  def with_options
  end
end
