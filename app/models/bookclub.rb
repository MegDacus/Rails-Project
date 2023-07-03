class Bookclub < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    has_many :books
    has_many :genres, through: :books
end
