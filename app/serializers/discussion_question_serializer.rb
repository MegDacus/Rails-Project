class DiscussionQuestionSerializer < ActiveModel::Serializer
  belongs_to :book
  attributes :body
  has_many :comments
end
