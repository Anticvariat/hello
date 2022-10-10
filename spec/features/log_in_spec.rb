# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log in', js: true do
  let(:user) { create(:user) }

  feature 'Sign in' do
    scenario 'Sign in with correct params' do
      visit new_user_session_path

      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Войти'
      
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
