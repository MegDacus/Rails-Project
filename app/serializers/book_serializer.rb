class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author

  belongs_to :genre
  has_many :bookclubs
  has_many :discussion_questions
end
