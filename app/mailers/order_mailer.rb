# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default to: ENV.fetch('GMAIL_USERNAME', nil)
  def contact_me_mail(params, current_user)
    @user = current_user
    @message = params[:message_body]
    @url = ENV.fetch('HELLO_HOST', nil)
    mail(subject: "#{@first_name} sent you a message")
  end
end
