# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Article' do
  let(:user) { create(:user) }

  feature 'Create Article' do
    scenario 'Create Article with correct params' do
      sign_in user
      visit new_article_path
      fill_in 'article[title]', with: 'test'
      fill_in 'article[body]', with: 'example article'
      click_button 'Сохранить'
      expect(page).not_to have_content 'Новая статья'
    end
  end
end
