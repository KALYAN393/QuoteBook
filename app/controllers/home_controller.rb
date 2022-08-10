class HomeController < ApplicationController
  def index
    @home = HomePosts.new(current_user)

  end
  def show
    @sharedposts=Post.sharedposts(current_user.id)
  end
  
  def search

    @search=SearchPosts.new(params[:search])

  end
end
end
