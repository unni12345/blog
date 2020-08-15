class Post < ApplicationRecord
  has_many  :comments, dependent: :destroy
  validates :content, presence: true
  # include ActiveModel::Conversion
  # extend  ActiveModel::Naming
end
