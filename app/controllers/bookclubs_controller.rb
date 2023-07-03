class BookclubsController < ApplicationController
    def index
        clubs = Bookclub.all
        render json: clubs, status: :ok
    end
end
