# frozen_string_literal: true

class AboutMeController < ApplicationController
  def index; end

  def create
    OrderMailer.contact_me_mail(contact_me_params).deliver_now
    redirect_to root_path
  end

  private

  def contact_me_params
    params.permit(:first_name, :email, :message_body, :authenticity_token)
  end
end
