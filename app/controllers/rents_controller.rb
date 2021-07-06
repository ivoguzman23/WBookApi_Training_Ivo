# frozen_string_literal: true

class RentsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  after_action :send_rent_mail, only: [:create], if: -> { @book }

  def index
    @rents = Rent.where(user_id: current_user.id)
    if @rents.blank?
      render json: { error: 'The user has no rents' }, status: :not_found
    else
      render json: @rents
    end
    # authorize @rents
  end

  def create
    @book = Book.find(params[:rent][:book_id])
    @rent = Rent.create(user: current_user, book: @book,
                        from: params[:rent][:from], to: params[:rent][:to])
    render json: @rent
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'The book you specified was not found' },
           status: :unprocessable_entity
  end

  def send_rent_mail
    user = current_user
    title = @book[:title]
    AfterRentEmailWorker.perform_async(user[:email], user[:fist_name], title, @rent[:to])
  end
end
