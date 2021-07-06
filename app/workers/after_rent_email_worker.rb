class AfterRentEmailWorker
  include Sidekiq::Worker

  def perform(email, first_name, title, to)
    RentMailer.after_new_rent_mail(email, first_name, title, to).deliver
  end
end
