class SearchPosts

    def initialize(text)
        if text.blank?
            redirect_to home_index_path and return
        else
            @search_term = text
        end
    end

    def postsbytag
        tag=Tag.where("name LIKE ?","%#{@search_term}%")
        Post.filtertags(tag.ids.first)
    end

end