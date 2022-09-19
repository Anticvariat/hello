# frozen_string_literal: true

require 'rails_helper'

describe Article do
  describe "#create" do
    VALID_TITLE = 'title'
    VALID_ARTICLE_BODY = 'valid body'
    let(:user) { User.new(email: '1@1.1', password: '123456', first_name: 'rspec', last_name: 'user') }

    context 'with valid atributes' do
      let(:article) { Article.new(user: user, title: VALID_TITLE, body: VALID_ARTICLE_BODY, status: 'public') }

      it 'is valid' do
        expect(article).to be_valid
      end
    end

    context 'without body' do
      let(:article) { Article.new(user: user, title: VALID_TITLE, body: nil, status: 'public') }

      it 'is valid' do
        expect(article).not_to be_valid
      end
    end
  end
end
