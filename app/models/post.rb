# frozen_string_literal: true
class Post < ApplicationRecord
  validates :text, presence: true, length: { minimum: 10, maximum: 800 }

  belongs_to  :User

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  has_many :post_users, dependent: :destroy
  has_many :users, through: :post_users

  enum :post_type, { confidential: 0, universal: 1, sharable: 2 }

  default_scope -> { order(created_at: :desc)}

  scope :published_posts, ->(user_id) { where("(post_type = ? OR User_id = ?) AND isStory = ?", 1, user_id,false) }

  scope :published_stories, -> {where("isStory = ?",true)}

  scope :shared_posts, ->(user_id) { joins(:post_users).where(:post_users  => {user_id: user_id},:posts=>{isStory: false})}

  scope :filter_tags, ->(tagid= a) {joins(:tags).where(:tags =>{id: tagid},:posts=>{post_type: "universal",isStory: false})}


  # handle_asynchronously :delete_story, :run_at => Proc.new { 1.minutes.from_now }
  # def delete_story
  #   # do some delayed stuff her
  #   puts "hi inside delete_story"
  # end
end
