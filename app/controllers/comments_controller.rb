class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :destroy]

    def index
        comments = Comment.where(discussion_question_id: params[:discussion_question_id]) 
        render json: comments, status: :ok
    end

    def create
        question = DiscussionQuestion.find_by(id: params[:discussion_question_id])
        comment = question.comments.create!(user_id: @current_user.id, body: params[:body])

        render json: comment, status: :created
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment[:user_id] == @current_user.id
            comment.destroy 
            head :no_content
        else  
            render json: {error: "You are unauthorized to delete comments made by a different user"}, status: :unauthorized
        end
    end
end
