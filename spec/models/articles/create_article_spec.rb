# frozen_string_literal: true

require 'rails_helper'

describe Article do
  describe ".create" do
    VALID_ARTICLE_TITLE = 'title'
    VALID_ARTICLE_BODY = 'valid body'

    let(:user) { create(:user) }

    context 'with valid atributes' do
      let(:article) { Article.new(user: user, title: VALID_ARTICLE_TITLE, body: VALID_ARTICLE_BODY, status: 'public') }

      it 'is valid' do
        expect{article.save}.to change(Article, :count).by(1)
      end
    end

    context 'without body' do
      let(:article) { Article.new(user: user, title: VALID_ARTICLE_TITLE, body: nil, status: 'public') }

      it 'is valid' do
        expect{article.save}.to change(Article, :count).by(0)
      end
    end

    context 'without title' do
      let(:article) { Article.new(user: user, title: nil, body: VALID_ARTICLE_BODY, status: 'public') }

      it 'is valid' do
        expect{article.save}.to change(Article, :count).by(0)
      end
    end
  end
end
