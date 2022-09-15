# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe "#create" do
    context 'with valid atributes' do
      let(:user) { User.new(email: '1@1.1', password: '123456', first_name: 'rspec', last_name: 'user') }

      it 'is valid' do
        expect(user).to be_valid
      end
    end

    context 'without first_name' do
      let(:user) { User.new(email: '1@1.1', password: '123456', first_name: nil, last_name: 'user') }

      it 'is not valid' do
        expect(user).not_to be_valid
      end
    end

    context 'without last_name' do
      let(:user) { User.new(email: '1@1.1', password: '123456', first_name: 'rspec', last_name: nil) }

      it 'is not valid' do
        expect(user).not_to be_valid
      end
    end
  end
end
