class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author

  has_many :bookclubs, if: -> { should_include?(:bookclubs) }

  def should_include?(association)
    !instance_options[:exclude]&.include?(association.to_s)
  end
end
