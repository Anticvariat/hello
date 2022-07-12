class AllArticlesController < ApplicationController
  def index
    @articles = Article.where(status: :public).order(:created_at).page(params[:page]).per(15)
  end
end
