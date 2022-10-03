# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default to: ENV.fetch('GMAIL_USERNAME', nil)
  
  def contact_me_mail(params)
    @first_name = params[:first_name]
    @message = params[:message_body]
    @email = params[:email]
    @url = ENV.fetch('HELLO_HOST', nil)
    mail(subject: "#{@first_name} sent you a message")
  end
end
