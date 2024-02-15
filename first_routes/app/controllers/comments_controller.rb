class CommentsController < ApplicationController
    def index
        safe_params = params
        if safe_params[:user_id]
            response = Comment.where(author_id: safe_params[:user_id])
            render json: response
        elsif safe_params[:artwork_id]
            response = Comment.where(artwork_id: safe_params[:artwork_id])
            render json: response
        else
            render plain: "must provide author or artwork id", status: :unprocessable_entity
        end
    end

    def create
        comment = Comment.new(comments_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy

    end

    private
    def comments_params
        params.require(:comments).permit(:author_id, :artwork_id, :body)
    end
end
