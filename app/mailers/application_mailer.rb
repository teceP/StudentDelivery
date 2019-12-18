# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "notify@studentdelivery.herokuapp.com"
  layout "mailer"
end
