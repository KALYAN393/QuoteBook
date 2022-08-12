# frozen_string_literal: true

class Dashboard
  def initialize(current_user)
    @current_user = current_user
  end
  attr_reader :current_user

  def posts
    Post.published_posts(current_user.id)
  end

  def stories
    Post.published_stories
  end

  def comment
    Comment.new
  end

  def on_tag_exists(tags)
    yield if tags.exists?
  end
end
