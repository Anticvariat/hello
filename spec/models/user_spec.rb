# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe "#create" do
    VALID_FIRST_NAME = 'rspec'
    VALID_LAST_NAME = 'user'
    context 'with valid atributes' do
      let(:user) { User.new(email: '1@1.1', password: '123456', first_name: VALID_FIRST_NAME, last_name: VALID_LAST_NAME) }

      it 'is valid' do
        expect{user.save}.to change(User, :count).by(1)
      end
    end

    context 'without first_name' do
      let(:user) { User.new(email: '1@1.1', password: '123456', first_name: nil, last_name: VALID_LAST_NAME) }

      it 'is not valid' do
        expect{user.save}.to change(User, :count).by(0)
      end
    end

    context 'without last_name' do
      let(:user) { User.new(email: '1@1.1', password: '123456', first_name: VALID_FIRST_NAME, last_name: nil) }

      it 'is not valid' do
        expect{user.save}.to change(User, :count).by(0)
      end
    end
  end
end
