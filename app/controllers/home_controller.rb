class HomeController < ApplicationController

  def index
    @home = Dashboard.new(current_user)
  end

  def show
    @shared_posts = Post.shared_posts(current_user.id)
  end

  def search
    if params[:search].blank?
      redirect_to home_index_path and nil
    else
      @search = SearchPosts.new(params[:search])
    end

  end

end
