# frozen_string_literal: true

require 'rails_helper'

describe Comment do
  describe '.destroy' do
    let(:user) { create(:user) }
    let(:article) { create(:article) }

    context 'when comment present' do
      it 'deletes comment' do
        comment = described_class.create(user: user, article: article, body: '12345')

        expect { comment.destroy }.to change(described_class, :count).by(-1)
        expect { comment.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when comment not present' do
      it 'deletes comment' do
        comment = described_class.new

        expect { comment.destroy }.not_to change(described_class, :count)
        expect { comment.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
