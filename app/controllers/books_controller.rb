class BooksController < ApplicationController
  def index
    render json: Book
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end
end
