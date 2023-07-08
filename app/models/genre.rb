class Genre < ApplicationRecord
    has_many :books
    has_many :bookclubs, through: :books
end
