class Post < ApplicationRecord
  belongs_to :User

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  
  enum :post_type, { confidential: 0, universal: 1 }

  
end
