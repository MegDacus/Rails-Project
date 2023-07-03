class User < ApplicationRecord
    has_many :memberships
    has_many :bookclubs, through: :memberships
    has_many :comments

end
