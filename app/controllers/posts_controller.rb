class PostsController < ApplicationController
  
  def index
    @userposts = Post.where(User_id: current_user.id).order(created_at: :desc)
  end

  def new
    @post=Post.new
  end

  def create
    if user_signed_in?
    @post=Post.new(post_params)

    if @post.save
      redirect_to home_index_path, flash: { success: "post was created successfully!"}
   else
     render 'new'
   end
  end
end


def show
  @post=Post.find(params[:id])

end


def edit
  @post=Post.find(params[:id])
end

def update
  @post=Post.find(params[:id])
  @post.update(text: params[:post][:text])
  redirect_to posts_path
end

def destroy

  @post=Post.find(params[:id])
  @post.destroy

  respond_to do |format|
    format.html { redirect_to posts_url, status: :see_other, notice: "Post was successfully destroyed." }
    format.json { head :no_content }
  end
end

  private
  def post_params
    params.require(:post).permit(:text,:post_type,:User_id,:isStory, tag_ids: [], user_ids: [])
  end
end
