# frozen_string_literal: true

require 'rails_helper'

describe Comment do
  describe "#create" do
    VALID_BODY = 'valid body'
    SHORT_BODY = 'hi'
    let(:user) { User.new(email: '1@1.1', password: '123456', first_name: 'rspec', last_name: 'user') }
    let(:article) { Article.new(user: user, title: 'article', body: 'article body', status: 'public') }
    
    context 'with valid atributes' do
      let(:comment) { Comment.new(user: user, article: article, body: VALID_BODY) }

      it 'is valid' do
        expect(comment).to be_valid
      end
    end

    context 'with short body length' do
      let(:comment) { Comment.new(user: user, article: article, body: SHORT_BODY) }

      it 'is valid' do
        expect(comment).not_to be_valid
      end
    end
  end
end
