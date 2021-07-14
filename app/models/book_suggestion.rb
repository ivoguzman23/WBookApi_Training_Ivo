class BookSuggestion < ApplicationRecord
    validates :author, :title, :link, :publisher, :year, presence: true
end
