# frozen_string_literal: true

class AboutMeController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def create
    OrderMailer.contact_me_mail(contact_me_params, current_user).deliver_now
    redirect_to root_path
  end

  private

  def contact_me_params
    params.permit(:message_body, :authenticity_token)
  end
end
