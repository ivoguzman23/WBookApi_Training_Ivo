# frozen_string_literal: true

class RentsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  after_action :send_rent_mail, only: [:create], if: -> { @book }
  after_action :verify_authorized, except: [:create]
  
  def index
    @rents = Rent.where(user_id: current_user.id)
    return render json: { error: 'The user has no rents' }, status: :not_found if @rents.blank?

    authorize @rents
    render json: @rents    
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
    AfterRentEmailWorker.perform_async(user[:email], user[:first_name], title, @rent[:to], user[:locale])
  end
end
