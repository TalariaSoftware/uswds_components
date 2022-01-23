class Article
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :title, :body

  validates :title, presence: true
  validates :body, presence: true
end
