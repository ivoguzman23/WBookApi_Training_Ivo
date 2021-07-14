# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'ivo.guzman@widergy.com'
  layout 'mailer'
end
