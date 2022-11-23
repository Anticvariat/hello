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
      flash[:notice] = 'Статья успешно создана!'
    else
      flash[:alert] = @article.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
      flash[:notice] = 'Статья успешно изменена!'
    else
      flash[:alert] = @article.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    
    flash[:alert] = "Статья " + '"' + "#{@article.title}" + '"' + " удалена"
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id)
  end
end
