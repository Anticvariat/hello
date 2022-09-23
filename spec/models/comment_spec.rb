# frozen_string_literal: true

require 'rails_helper'

describe Comment do
  describe "#create" do
    VALID_BODY = 'valid body'
    SHORT_BODY = 'hi'
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    
    context 'with valid atributes' do
      let(:comment) { Comment.new(user: user, article: article, body: VALID_BODY) }

      it 'is valid' do
        expect{comment.save}.to change(Comment, :count).by(1)
      end
    end

    context 'with short body length' do
      let(:comment) { Comment.new(user: user, article: article, body: SHORT_BODY) }

      it 'is valid' do
        expect{comment.save}.to change(Comment, :count).by(0)
      end
    end
  end
end
