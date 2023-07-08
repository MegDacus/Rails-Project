class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author

  has_many :bookclubs, if: -> { should_include?(:bookclubs) }
  has_many :discussion_questions, if: -> { should_include?(:discussion_questions) }

  def should_include?(association)
    !instance_options[:exclude]&.include?(association.to_s)
  end
end
