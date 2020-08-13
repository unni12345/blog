class BlogCommentRelationship < ApplicationRecord
  belongs_to :blog
  belongs_to :user
end
