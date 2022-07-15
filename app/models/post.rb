class Post < ApplicationRecord
  belongs_to :User

  has_many :likes

  
  enum :post_type, { confidential: 0, universal: 1 }

  
end
