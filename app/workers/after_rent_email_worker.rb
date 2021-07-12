# frozen_string_literal: true

class AfterRentEmailWorker
  include Sidekiq::Worker

  def perform(email, first_name, title, to, locale)
    RentMailer.after_new_rent_mail(email, first_name, title, to, locale).deliver
  end
end
