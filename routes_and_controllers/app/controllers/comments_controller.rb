class CommentsController < ApplicationController
    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: 422
        end
        
    end

    def destroy 
        comment = Comment.find_by(id: params(:id))

        if comment && comment.destroy
            redirect_to comments_url
        else
            render json: {'error': "Comment doesn't exist"}, status: 404
    end

    def index
        comments = Comment.all
        render json: comments
    end

    private
    def comment_params
        params.require(:comment).permit(:artist_id, :artwork_id, :body)
    end
end
