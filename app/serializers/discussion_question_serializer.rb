class DiscussionQuestionSerializer < ActiveModel::Serializer
  attributes :id, :body


  belongs_to :book
  has_many :comments
end
