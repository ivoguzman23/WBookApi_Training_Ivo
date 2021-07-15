# frozen_string_literal: true

class BookSuggestionController < ApplicationController
  respond_to :json

  def index
    @booksuggestions = BookSuggestion.all
    return render json: { error: 'There are no book suggestions to show' }, status: :not_found if @booksuggestions.blank?
    render json: @booksuggestions
  end
  
  def create
    @book_suggestion = BookSuggestion.create(book_suggestion_params)
    response.status = 201
    render json: @book_suggestion
  end

  def book_suggestion_params
    params.require(:bookSuggestion).permit(:author, :title, :link, :publisher, :year, :price, :editorial)
  end
end
