# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Article' do
  let(:user) { create(:user) }
  let(:title) { 'test' }
  let(:body) { 'example article' }

  before do
    sign_in user
    visit new_article_path
  end

  feature 'Create Article' do
    scenario 'Create Article with correct params' do
      fill_in 'article[title]', with: title
      fill_in 'article[body]', with: body
      click_button 'Сохранить'

      title_section = find_by_id('article-title')
      body_section = find_by_id('article-body')

      expect(page).to have_current_path "/articles/#{Article.last.id}"
      # expect([:notice]).to eq 'Статья успешно создана!'
      expect(page).to have_content 'Статья успешно создана!'
      expect(title_section).to have_content title
      expect(body_section).to have_content body
    end
  end
end
