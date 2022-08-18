# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log in' do
  let(:user) { create(:user) }

  feature 'Sign in' do
    scenario 'Sign in with correct params' do
      visit root_path
      click_on 'Вход'

      #fill_in 'Email', :with => user.email
      #fill_in 'Пароль', :with => '123456'

      #fill_in 'user_email', with: user.email
      #fill_in 'user_password', with: '123456'
      #click_button 'Войти'
      expect(page).to have_content 'AAaaaaa'
    end
  end
end
