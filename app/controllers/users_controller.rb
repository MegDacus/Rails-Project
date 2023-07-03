class UsersController < ApplicationController
    skip_before_action :authorize_user, only: :create
    skip_before_action :verify_authenticity_token, only: :create

    def index
        users = User.all 
        render json: users, status: :ok 
    end

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show
        render json: @current_user, status: :ok
    end

    private

    def user_params
        params.permit(:username, :first_name, :last_name, :password, :password_confirmation)
    end
end
