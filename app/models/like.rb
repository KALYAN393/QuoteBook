class Like < ApplicationRecord
  belongs_to :User
  belongs_to :Post
  validates_uniqueness_of :Post_id, scope: :User_id

  after_create :increase_post_like
  before_destroy :decrease_post_like
  

  def increase_post_like
    Post.find(self.Post_id).increment(:total_likes_count).save!
  end

  def decrease_post_like
    Post.find(self.Post_id).decrement(:total_likes_count).save!
  end

end
