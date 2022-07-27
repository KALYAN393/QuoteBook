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

  default_scope -> { order(created_at: :desc)}

  scope :published_posts, ->(user=current_user.id) { where("(post_type = ? OR User_id = ?) AND isStory = ?", 1, user,false) }
   
  scope :published_stories, -> {where("isStory = ?",true)}

  scope :sharedposts, ->(user=current_user.id) { joins(:post_users).where(:post_users  => {user_id: user},:posts=>{isStory: false})}
   
  scope :filtertags, ->(tagid= a) {joins(:tags).where(:tags =>{id: tagid},:posts=>{post_type: "universal",isStory: false})}
end
