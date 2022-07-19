class Post < ApplicationRecord
  validates :text, presence: true, length: { minimum: 10, maximum: 800 }

  belongs_to :User

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  has_many :post_users, dependent: :destroy
  has_many :users, through: :post_users

  
  enum :post_type, { confidential: 0, universal: 1, sharable: 2 }

  
end
