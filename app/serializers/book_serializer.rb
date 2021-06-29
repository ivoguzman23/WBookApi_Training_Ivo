class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :image, :publisher, :year
end
