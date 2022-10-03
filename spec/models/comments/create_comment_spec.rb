# frozen_string_literal: true

require 'rails_helper'

describe Comment do
  describe "#create" do
    VALID_BODY = 'valid body'
    MIN_LENGTH_BODY = 'hello'
    MAX_LENGTH_BODY = '12345678901234567890123456789012345678901234567890123456789012345678901234567890'
    SHORT_LENGTH_BODY = 'hi'
    LONG_LENGTH_BODY = '123456789012345678901234567890123456789012345678901234567890123456789012345678901'

    let(:user) { create(:user) }
    let(:article) { create(:article) }
    
    context 'with valid atributes' do
      let(:comment) { Comment.new(user: user, article: article, body: VALID_BODY) }

      it 'is valid' do
        expect{comment.save}.to change(Comment, :count).by(1)
      end
    end

    context 'with maximum body length' do
      let(:comment) { Comment.new(user: user, article: article, body: MAX_LENGTH_BODY) }

      it "is not valid" do
        expect{comment.save}.to change(Comment, :count).by(1)
      end
    end

    context 'with minimum body length' do
      let(:comment) { Comment.new(user: user, article: article, body: MIN_LENGTH_BODY) }

      it 'is not valid' do
        expect{comment.save}.to change(Comment, :count).by(1)
      end
    end

    context 'with too short body length' do
      let(:comment) { Comment.new(user: user, article: article, body: SHORT_LENGTH_BODY) }

      it "is not valid" do
        expect{comment.save}.to change(Comment, :count).by(0)
      end
    end

    context 'with too long body length' do
      let(:comment) { Comment.new(user: user, article: article, body: LONG_LENGTH_BODY) }

      it "is not valid" do
        expect{comment.save}.to change(Comment, :count).by(0)
      end
    end

    context 'without body' do
      let(:comment) { Comment.new(user: user, article: article, body: nil) }

      it 'is not valid' do
        expect{comment.save}.to change(Comment, :count).by(0)
      end
    end

    context 'without article' do
      let(:comment) { Comment.new(user: user, body: VALID_BODY) }

      it 'is not valid' do
        expect{comment.save}.to change(Comment, :count).by(0)
      end
    end

    context 'without user' do
      let(:comment) { Comment.new(article: article, body: VALID_BODY) }

      it 'is not valid' do
        expect{comment.save}.to change(Comment, :count).by(0)
      end
    end
  end
end
