# frozen_string_literal: true

class BooksController < ApplicationController
  # before_action :authenticate_user!
  include Wor::Paginate
  def index
    @books = Kaminari.paginate_array(Book.all).page(params[:page]).per(5)
    render_paginated @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not found' }, status: :not_found
  end
end
