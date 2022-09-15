# frozen_string_literal: true

require 'rails_helper'

describe Article do
  context 'with valid atributes' do
    let(:article) { build(:article) }

    it 'is valid' do
      expect(article).to be_valid
    end
  end

  context 'without title' do
    let(:article) { build(:article, title: nil) }

    it 'is not valid' do
      expect(article).not_to be_valid
    end
  end

  context 'without body' do
    let(:article) { build(:article, body: nil) }

    it 'is not valid' do
      expect(article).not_to be_valid
    end
  end

  context 'without user' do
    let(:article) { build(:article, user_id: nil) }

    it 'is not valid' do
      expect(article).not_to be_valid
    end
  end
end
