# frozen_string_literal: true

require 'rails_helper'

describe Comment do
  context 'with valid atributes' do
    let(:comment) { build(:comment) }

    it 'is valid' do
      expect(comment).to be_valid
    end
  end

  context 'without body' do
    let(:comment) { build(:comment, body: nil) }

    it 'is not valid' do
      expect(comment).not_to be_valid
    end
  end

  context 'without user' do
    let(:comment) { build(:comment, user_id: nil) }

    it 'is not valid' do
      expect(comment).not_to be_valid
    end
  end
end
