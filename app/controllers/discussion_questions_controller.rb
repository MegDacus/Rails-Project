class DiscussionQuestionsController < ApplicationController

    def index
        questions = DiscussionQuestion.all 
        render json: questions, status: :ok
    end
end
