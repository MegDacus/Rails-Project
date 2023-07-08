class DiscussionQuestionsController < ApplicationController

    def index
        questions = DiscussionQuestion.where(book_id: params[:book_id])
        render json: questions, status: :ok
    end

    def show
        question = DiscussionQuestion.find_by(id: params[:id])
        render json: question, status: :ok
    end
end
