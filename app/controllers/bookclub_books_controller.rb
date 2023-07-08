class BookclubBooksController < ApplicationController
    def create
        book = BookclubBook.create!(club_book_params)
        render json: book, status: :created
    end

    def index
        club_books = BookclubBook.where(bookclub_id: params[:bookclub_id])
        render json: club_books
    end

    private

    def club_book_params
        params.permit(:bookclub_id, :book_id, :month)
    end
end
