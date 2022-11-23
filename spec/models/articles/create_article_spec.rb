# frozen_string_literal: true

require 'rails_helper'

describe Article do
  describe '.create' do
    let(:user) { create(:user) }
    let(:valid_article_title) { 'title' }
    let(:valid_article_body) { 'valid body' }

    context 'with valid atributes' do
      let(:article) do
        described_class.new(user: user, title: valid_article_title, body: valid_article_body, status: 'public')
      end

      it 'is valid' do
        expect { article.save }.to change(described_class, :count).by(1)
      end
    end

    context 'without body' do
      let(:article) { described_class.new(user: user, title: valid_article_title, body: nil, status: 'public') }

      it 'is valid' do
        expect { article.save }.not_to change(described_class, :count)
      end
    end

    context 'without title' do
      let(:article) { described_class.new(user: user, title: nil, body: valid_article_body, status: 'public') }

      it 'is valid' do
        expect { article.save }.not_to change(described_class, :count)
      end
    end
  end
end
