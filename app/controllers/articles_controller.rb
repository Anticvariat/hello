# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @articles = Article.where(user_id: current_user, status: 'public')
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      redirect_to new_article_path, alert: @article.errors.full_messages.to_sentence
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      redirect_to edit_article_path(@article), alert: @article.errors.full_messages.to_sentence
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id)
  end
end
