# frozen_string_literal: true

require 'rails_helper'

describe Comment do
  describe '#create' do
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let(:valid_comment_body) { 'valid body' }
    let(:min_length_body) { 'hello' }
    let(:max_length_body) { '12345678901234567890123456789012345678901234567890123456789012345678901234567890' }
    let(:short_length_body) { 'hi' }
    let(:long_length_body) { '123456789012345678901234567890123456789012345678901234567890123456789012345678901' }

    context 'with valid atributes' do
      let(:comment) { described_class.new(user: user, article: article, body: valid_comment_body) }

      it 'is valid' do
        expect { comment.save }.to change(described_class, :count).by(1)
      end
    end

    context 'with maximum body length' do
      let(:comment) { described_class.new(user: user, article: article, body: max_length_body) }

      it 'is not valid' do
        expect { comment.save }.to change(described_class, :count).by(1)
      end
    end

    context 'with minimum body length' do
      let(:comment) { described_class.new(user: user, article: article, body: min_length_body) }

      it 'is not valid' do
        expect { comment.save }.to change(described_class, :count).by(1)
      end
    end

    context 'with too short body length' do
      let(:comment) { described_class.new(user: user, article: article, body: short_length_body) }

      it 'is not valid' do
        expect { comment.save }.not_to change(described_class, :count)
      end
    end

    context 'with too long body length' do
      let(:comment) { described_class.new(user: user, article: article, body: long_length_body) }

      it 'is not valid' do
        expect { comment.save }.not_to change(described_class, :count)
      end
    end

    context 'without body' do
      let(:comment) { described_class.new(user: user, article: article, body: nil) }

      it 'is not valid' do
        expect { comment.save }.not_to change(described_class, :count)
      end
    end

    context 'without article' do
      let(:comment) { described_class.new(user: user, body: valid_comment_body) }

      it 'is not valid' do
        expect { comment.save }.not_to change(described_class, :count)
      end
    end

    context 'without user' do
      let(:comment) { described_class.new(article: article, body: valid_comment_body) }

      it 'is not valid' do
        expect { comment.save }.not_to change(described_class, :count)
      end
    end
  end
end
