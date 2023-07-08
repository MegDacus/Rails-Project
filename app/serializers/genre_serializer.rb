class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :bookclubs, serializer: BookclubSerializer do
    object.bookclubs.uniq
  end
end

