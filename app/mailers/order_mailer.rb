# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default to: 'evgeny9823@gmail.com'
  def contact_me_mail(params)
    @first_name = params[:first_name]
    @message = params[:message_body]
    @email = params[:email]
    @url = 'http://localhost:3000/'
    mail(subject: "#{@first_name} sent you a message")
  end
end