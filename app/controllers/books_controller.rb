# frozen_string_literal: true

class BooksController < ApplicationController
  # before_action :authenticate_user!

  def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, status: 200
  end
end
