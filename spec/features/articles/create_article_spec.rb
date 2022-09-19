# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Article' do
  NEW_ARTICLE_TITLE = 'test'
  NEW_ARTICLE_BODY = 'example article'
  let(:user) { create(:user) }

  feature 'Create Article' do
    scenario 'Create Article with correct params' do
      sign_in user
      visit new_article_path
      fill_in 'article[title]', with: NEW_ARTICLE_TITLE
      fill_in 'article[body]', with: NEW_ARTICLE_BODY
      click_button 'Сохранить'
      title_section = find_by_id('article-title')
      body_section = find_by_id('article-body')
      expect(title_section).to have_content NEW_ARTICLE_TITLE
      expect(body_section).to have_content NEW_ARTICLE_BODY
    end
  end
end
