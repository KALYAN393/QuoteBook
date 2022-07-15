class LikesController < ApplicationController

  def save_like
    @post_id=params[:post_id]
    @like=Like.new(Post_id: params[:post_id], User_id: current_user.id)
    @post_likes=Post.select(:total_likes_count).where(id: @post_id)
    exiting_combination=Like.where(Post_id: params[:post_id], User_id: current_user.id)
    respond_to do |format|
      format.js {

        if exiting_combination.any?
          exiting_combination.first.destroy
          @success= false
        elsif @like.save
           @success= true
        else
          @success= false 
        end
     
        @post_likes=Post.find(@post_id).total_likes_count
         render "/posts/like"
        
      }
    end
  end
  # def index
  #   # debugger
  #   @like=Like.new(Post_id: params[:post_id], User_id: current_user.id)
  #   @post_id=params[:post_id]
  #   exiting_combination=Like.where(Post_id: params[:post_id], User_id: current_user.id)
  #   respond_to do |format|
  #     format.json {

  #       if exiting_combination.any?
  #         exiting_combination.destroy
  #         @success= false
  #       elsif @like.save
  #          @success= true
  #       else
  #         @success= false 
  #       end
     
  #        render "/post/like"
        
  #     }
  #   end
  # end

  # def create
  #   respond_to do |format|
  #     format.json {
  #       if @like.save!
  #         { success: true }
  #       else
  #         {success: false }
  #       end
  #     }
  #   end
  # end


  # def destroy
  #   @like=current_user.likes.find(params[:id])
  #   post=@like.Post
  #   @like.destroy
  #   redirect_to home_index_path

  # end

  # private

  # def permitter_params
  #   params.permit (:post_id)
  # end

  
end