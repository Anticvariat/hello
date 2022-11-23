# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default to: ENV.fetch('GMAIL_USERNAME', 'admin@example.example')

  def contact_me_mail(current_user, params)
    @user = current_user
    @message = params[:message_body]
    @email = @user.email
    @url = ENV.fetch('HELLO_HOST', 'http://localhost:3000')
    mail(subject: "#{@user.first_name} sent you a message")
  end
end
