class HomePosts

    def initialize(current_user)
        @current_user = current_user
    end

    def posts
        Post.published_posts(@current_user.id)
    end

    def stories
        Post.published_stories
    end

    def comment
        Comment.new
    end

end    