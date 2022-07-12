class Post < ApplicationRecord
  belongs_to :User

  enum :post_type, { confidential: 0, universal: 1 }
end
