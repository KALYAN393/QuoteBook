class Comment < ApplicationRecord
  validates :comment, presence: true

  belongs_to :User
  belongs_to :Post
end
