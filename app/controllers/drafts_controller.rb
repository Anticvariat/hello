# frozen_string_literal: true

class DraftsController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Article.where(user_id: current_user, status: 'draft')
  end
end
