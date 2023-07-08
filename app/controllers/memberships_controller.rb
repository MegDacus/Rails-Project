class MembershipsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :destroy]
   
    def index
        get_bookclub
        memberships = @bookclub.memberships.order(is_host: :desc)
        unless memberships.blank? 
            render json: memberships, status: :ok
        else  
            render json: 'There are currently no active memberships for this bookclub.', status: :not_found
        end
    end

    def show
        membership = Membership.find_by(user_id: params[:user_id])
        render json: membership, status: :ok
    end

    def create
        get_bookclub
        if @bookclub.memberships.exists?(user_id: @current_user.id)
          render json: { error: "Membership already exists for the current user" }, status: :unprocessable_entity
        else
          membership = @bookclub.memberships.create!(user_id: @current_user.id, is_host: false)
          render json: membership, status: :created
        end
    end

    def destroy 
        membership = Membership.find_by!(id: params[:id])
        if membership[:user_id] == @current_user.id
            membership.delete 
            head :no_content
        else  
            render json: {error: "Unauthorized"}, status: :unauthorized
        end 
    end
    
    private
    
    def get_bookclub
        @bookclub = Bookclub.find_by(id: params[:bookclub_id])
    end
end
