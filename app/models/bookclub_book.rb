class BookclubBook < ApplicationRecord
    belongs_to :bookclub
    belongs_to :book
end
