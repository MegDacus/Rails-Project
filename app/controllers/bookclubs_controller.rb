class BookclubsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :destroy]
    def index
        clubs = Bookclub.all
        render json: clubs, exclude: ['previous_books'], status: :ok
    end

    def create
        club = Bookclub.create!(bookclub_params)
        render json: club, status: :created
    end

    def show
        club = Bookclub.find_by!(id: params[:id])
        render json: club, include: ['this_months_book','this_months_book.discussion_questions','previous_books'], status: :ok
    end

    def destroy 
       club = Bookclub.find_by!(id: params[:id])
       if club[:host_user_id] == @current_user.id 
            club.delete
            head :no_content
       else
            render json: {error: "Only the host is authorized to delete the bookclub"}
       end 
    end

    private

    def bookclub_params
        params.permit(:name, :description, :host_user_id)
    end
 
end
