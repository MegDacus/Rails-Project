class BookclubSerializer < ActiveModel::Serializer
  attributes :name, :description

  has_many :users, serializer: BookclubUserSerializer
end
