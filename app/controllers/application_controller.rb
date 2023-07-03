class ApplicationController < ActionController::Base
    include ActionController::Cookies

    rescue_from ActiveRecord::RecordInvalid, with: :invalid_error_response
    before_action :authorize_user

    private

    def invalid_error_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

    def authorize_user
        @current_user = User.find_by(id: session[:user_id])

        render json: {error: "Not authorized"}, status: :unauthorized unless @current_user 
    end
end
