class MembershipsController < ApplicationController

    def index
        memberships = Membership.all 
        render json: memberships, status: :ok
    end

end
