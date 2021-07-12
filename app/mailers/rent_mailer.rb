# frozen_string_literal: true

class RentMailer < ApplicationMailer
  def after_new_rent_mail(email, first_name, title, to, locale)
    I18n.with_locale(locale) do
      @to = to
      @first_name = first_name
      @title = title
      @to = to
      mail to: email, subject: t(:rent_subject)
    end
  end
end
