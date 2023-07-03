class BookclubBook < ApplicationRecord
    belongs_to :bookclub
    belongs_to :book

    month_names = %w(January February March April May June July August September October November December)
    validates :month, inclusion: { in: month_names }
end
