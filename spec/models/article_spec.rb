# frozen_string_literal: true

require 'rails_helper'

describe Article do
  describe "#create" do
    VALID_TITLE = 'title'
    VALID_ARTICLE_BODY = 'valid body'
    let(:user) { create(:user) }

    context 'with valid atributes' do
      let(:article) { build(:article) }

      it 'is valid' do
        expect{article.save}.to change(Article, :count).by(1)
      end
    end

    context 'without body' do
      let(:article) { Article.new(user: user, title: VALID_TITLE, body: nil, status: 'public') }

      it 'is valid' do
        expect{article.save}.to change(Article, :count).by(0)
      end
    end
  end
end
