# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe '#create' do
    let(:valid_first_name) { 'rspec' }
    let(:valid_last_name) { 'user' }

    context 'with valid atributes' do
      let(:user) do
        described_class.new(email: '1@1.1', password: '123456', first_name: valid_first_name,
                            last_name: valid_last_name)
      end

      it 'is valid' do
        expect { user.save }.to change(described_class, :count).by(1)
      end
    end

    context 'without first_name' do
      let(:user) do
        described_class.new(email: '1@1.1', password: '123456', first_name: nil, last_name: valid_last_name)
      end

      it 'is not valid' do
        expect { user.save }.not_to change(described_class, :count)
      end
    end

    context 'without last_name' do
      let(:user) do
        described_class.new(email: '1@1.1', password: '123456', first_name: valid_first_name, last_name: nil)
      end

      it 'is not valid' do
        expect { user.save }.not_to change(described_class, :count)
      end
    end
  end
end
