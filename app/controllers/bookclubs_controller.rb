class BookclubsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :destroy]

    def index
        clubs = Bookclub.all
        render json: clubs, exclude: ['previous_books', 'discussion_questions']
    end

    def create
        club = Bookclub.create!(bookclub_params.merge(host_user_id: @current_user.id))
        Membership.create!(user_id: @current_user.id, bookclub_id: club.id, is_host: true)
        render json: club, status: :created
    end

    def show
        club = Bookclub.find_by!(id: params[:id])
        render json: club, include: ['this_months_book','discussion_questions','previous_books'], status: :ok
    end

    def destroy 
       club = Bookclub.find_by!(id: params[:id])
       membership = Membership.find_by!(bookclub_id: club.id, user_id: @current_user.id, is_host: true)
       
       if membership
            membership.delete
            club.delete
            head :no_content
       else
            render json: {error: "Only the host is authorized to delete the bookclub"}, status: :unprocessable_entity
       end 
    end

    private

    def bookclub_params
        params.permit(:name, :description)
    end
 
end
