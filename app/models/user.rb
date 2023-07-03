class User < ApplicationRecord
    has_secure_password
    
    has_many :memberships
    has_many :bookclubs, through: :memberships
    has_many :comments

    private

    def user_params
        params.permit(:username, :first_name, :last_name, :password, :password_confirmation)
    end

end
