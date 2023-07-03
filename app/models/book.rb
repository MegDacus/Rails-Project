class Book < ApplicationRecord
    belongs_to :genre
    has_many :bookclubs 
    has_many :questions
end
