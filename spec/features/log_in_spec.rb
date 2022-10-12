# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log in', js: true do
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: 'user@2.2') }
  let(:non_existent_user_email) { 'nonexistent@user.user' }

  before do
    visit new_user_session_path
  end

  feature 'Sign in' do
    scenario 'Sign in with correct params' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Войти'

      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_current_path '/'
      expect(page).to have_content user.email
    end

    scenario 'Sign in with incorrect params' do
      fill_in 'user_email', with: 'user@2'
      fill_in 'user_password', with: user2.password
      click_button 'Войти'

      # expect(flash[:notice]).to eq 'Invalid Email or password.'
      expect(page).to have_content 'Invalid Email or password.'
      expect(page).to have_current_path '/users/sign_in'
    end

    scenario 'Sign in with non-existent user' do
      fill_in 'user_email', with: non_existent_user_email
      fill_in 'user_password', with: user.password
      click_button 'Войти'

      # expect(flash[:notice]).to eq 'Invalid Email or password.'
      expect(page).to have_content 'Invalid Email or password.'
      expect(page).to have_current_path '/users/sign_in'
    end
  end
end
