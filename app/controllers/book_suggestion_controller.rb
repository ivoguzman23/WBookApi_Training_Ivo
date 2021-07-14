# frozen_string_literal: true

class BookSuggestionController < ApplicationController
  respond_to :json

  def create
    @book_suggestion = BookSuggestion.create(book_suggestion_params)
    response.status = 201
    render json: @book_suggestion
  end

  def book_suggestion_params
    params.require(:bookSuggestion).permit(:author, :title, :link, :publisher, :year)
  end
end
