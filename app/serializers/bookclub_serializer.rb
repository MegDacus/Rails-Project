class BookclubSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_one :this_months_book, serializer: BookSerializer, if: -> {this_months_book.present?}
  has_many :discussion_questions, if: -> {should_include?(:discussion_questions)}
  has_many :previous_books, serializer: BookSerializer, if: -> {should_include?(:previous_books)}

  def this_months_book
    bookclub_book = BookclubBook.where(month: current_month, bookclub_id: object.id).first
    Book.find_by(id: bookclub_book&.book_id)
  end

  def previous_books 
    books_array = object.bookclub_books.where.not(month: current_month)
    books_array.map { |bookclub_book| Book.find_by(id: bookclub_book.book_id)}
  end
  
  private 

  def should_include?(association)
  !instance_options[:exclude]&.include?(association.to_s)
  end

  def current_month 
    Time.now.strftime('%B')
  end

end
