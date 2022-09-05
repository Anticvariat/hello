# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Comment' do
  let(:user) { create(:user) }

  feature 'Create Comment' do
    scenario 'Create Comment with correct params' do
      sign_in user
      visit new_article_path
      fill_in 'article[title]', with: 'test'
      fill_in 'article[body]', with: 'example article'
      click_button 'Сохранить'
      fill_in 'comment_body', with: 'rspec test comment with valid params'
      click_button 'Отправить'
      expect(page).to have_content user.first_name
    end
  end
end
