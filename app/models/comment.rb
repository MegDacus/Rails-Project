class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :discussion_question
end
