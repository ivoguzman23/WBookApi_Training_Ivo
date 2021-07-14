# frozen_string_literal: true

class RentMailer < ApplicationMailer
  def after_new_rent_mail(email, first_name, title, to)
    @to = to
    @title = title
    @first_name = first_name
    mail to: email, subject: 'Example'
  end
end
