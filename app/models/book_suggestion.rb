# frozen_string_literal: true

class BookSuggestion < ApplicationRecord
  validates :author, :title, :link, :publisher, :year, presence: true
end
