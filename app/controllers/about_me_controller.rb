# frozen_string_literal: true

class AboutMeController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def create
    first_name = current_user.first_name
    email = current_user.email
    OrderMailer.contact_me_mail(contact_me_params).deliver_now
    redirect_to root_path
  end

  private

  def contact_me_params
    params.permit(:message_body, :authenticity_token)
  end
end
