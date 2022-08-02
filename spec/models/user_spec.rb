require 'rails_helper'

describe User do
  subject(:model) { described_class.new(user_params) }

  context 'with valid atributes' do
    let(:user_params) { { email: "hi@mail.ru", password: "123456", first_name: "Qwerty", last_name: "Uiop"} }
    it 'is valid' do
      expect(model).to be_valid
    end
  end

  context 'without email' do
    let(:user_params) { { email: "", password: "123456", first_name: "Qwerty", last_name: "Uiop" } }
    it 'is not valid' do
      expect(model).not_to be_valid
    end
  end

  context 'without first_name' do
    let(:user_params) { { email: "hi@mail.ru", password: "123456", first_name: "", last_name: "Uiop" } }
    it 'is not valid' do
      expect(model).not_to be_valid
    end
  end

  context 'without last_name' do
    let(:user_params) { { email: "hi@mail.ru", password: "123456", first_name: "Qwerty", last_name: "" } }
    it 'is not valid' do
      expect(model).not_to be_valid
    end
  end
  
end