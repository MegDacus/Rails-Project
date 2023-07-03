class Bookclub < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    has_many :bookclub_books
    has_many :books, through: :bookclub_books
end
