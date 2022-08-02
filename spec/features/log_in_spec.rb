# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log in' do
  let(:user) { create(:user) }
  context 'log in' do
    it 'is valid' do
      visit root_path
      click_on 'Войти'
      fill_in 'Email', with: 'example@mail.ru'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content 'Home page'
    end
  end
end
