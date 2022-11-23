class CreateArticle
  include Interactor

  delegate :article_params, to: :context

  def call
    context.article = article

    context.fail!(error: article.errors.full_messages.to_sentence) unless article.save
  end

  private

  def article
    @article ||= Article.new(article_params)
  end
end