# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log in' do
  let(:user) { create(:user) }
  feature 'Sign in' do
    scenario 'Sign in with correct params' do
      visit root_path
      click_on 'Войти'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end
  end
end
