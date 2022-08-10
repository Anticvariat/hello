# frozen_string_literal: true

require 'rails_helper'

describe User do
  context 'with valid atributes' do
    let(:user) { build(:user) }

    it 'is valid' do
      expect(user).to be_valid
    end
  end

  context 'without email' do
    let(:user) { build(:user, email: nil) }

    it 'is not valid' do
      expect(user).not_to be_valid
    end
  end

  context 'without first_name' do
    let(:user) { build(:user, first_name: nil) }

    it 'is not valid' do
      expect(user).not_to be_valid
    end
  end

  context 'without last_name' do
    let(:user) { build(:user, last_name: nil) }

    it 'is not valid' do
      expect(user).not_to be_valid
    end
  end
end
