# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log in' do
  let(:user) { create(:user) }

  feature 'Sign in' do
    scenario 'Sign in with correct params' do
      visit root_path
      click_on 'Вход'

      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      screenshot_and_open_image

      #fill_in 'user_email', with: user.email
      #fill_in 'user_password', with: '123456'
      click_button 'Sign in'
      save_screenshot('tmp/capybara/image.png')
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
