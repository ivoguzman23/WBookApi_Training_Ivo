# frozen_string_literal: true

class BookSuggestionController < ApplicationController
  respond_to :json

  def create
    @bookSuggestion = BookSuggestion.create(author: params[:bookSuggestion][:author],
                                            title: params[:bookSuggestion][:title],
                                            link: params[:bookSuggestion][:link], 
                                            publisher: params[:bookSuggestion][:publisher],
                                            year: params[:bookSuggestion][:year], 
                                            user_id: current_user.id)
    response.status = 201
    render json: @bookSuggestion
  end
end
