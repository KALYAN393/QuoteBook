# frozen_string_literal: true

class SearchPosts
  def initialize(text)
    @search_term = text
  end

  attr_reader :search_term

  def postsbytag
    tag = Tag.where('name LIKE ?', "%#{search_term}%")
    Post.filter_tags(tag.ids.first)
  end
end
