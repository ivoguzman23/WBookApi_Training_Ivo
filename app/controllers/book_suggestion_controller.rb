# frozen_string_literal: true

class BookSuggestionController < ApplicationController
  include Wor::Paginate
  respond_to :json

  def index
    @booksuggestions = BookSuggestion.all
    return render json: { error: 'There are no book suggestions to show' }, 
                  status: :not_found if @booksuggestions.blank?

    render_paginated @booksuggestions
  end

  def create
    all_params =  book_suggestion_params.merge(user: current_user)
    @book_suggestion = BookSuggestion.new(all_params)
    return render json: @book_suggestion, status: :created if @book_suggestion.save

    render json: @book_suggestion.errors, status: :unprocessable_entity
  end

  def book_suggestion_params
    params.require(:bookSuggestion).permit(:author, :title, :link, :publisher, :year, :price, :editorial)
  end
end
