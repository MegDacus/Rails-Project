class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :destroy]
    def index
        books = Book.all
        render json: books, exclude: ['bookclubs', 'discussion_questions'], status: :ok
    end

   def show
        book = Book.find_by(id: params[:id])
        render json: book, status: :ok
   end

   def create
     if @current_user[:is_admin] == true
        book = Book.create!(book_params)
        render json: book, status: :created
     else  
        render json: {error: "Only admin can add new books to our website"}, status: :unauthorized
     end
   end

   def destroy 
    if @current_user[:is_admin] == true 
        book = Book.find_by!(id: params[:id])
        book.delete 
        head :no_content 
    else  
        render json: {error: "Only admin can delete a book from our website"}, status: :unauthorized
    end
   end

   private

   def book_params 
    params.permit(:genre_id, :title, :author)
   end
end
