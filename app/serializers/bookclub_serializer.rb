class BookclubSerializer < ActiveModel::Serializer
  attributes :id, :name, :description


  has_many :this_months_book, serializer: BookSerializer do
    this_months_book = BookclubBook.where(month: Time.now.strftime('%B')).where(bookclub_id: self.object.id).first
    if this_months_book&.book_id
      Book.find_by(id: this_months_book.book_id)
    end
  end

  has_many :previous_books, if: -> {should_include?(:previous_books)}, serializer: BookSerializer do
    month = Date.current.strftime('%B')
    books_array = object.bookclub_books.where.not(month: month)
    books_array.map do |book|
      Book.find_by(id: book.book_id)
    end
  end

  def should_include?(association)
    !instance_options[:exclude]&.include?(association.to_s)
  end
end
