class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name

  has_many :memberships
  has_many :comments
end
