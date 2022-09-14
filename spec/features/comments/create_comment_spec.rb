# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Comment' do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  feature 'Create Comment' do
    scenario 'Create Comment with correct params' do
      sign_in user
      visit article_path(article.id)
      fill_in 'comment_body', with: 'comment with valid params'
      click_button 'Отправить'
      section = find_by_id('comments')
      expect(section).to have_content user.first_name
    end
  end
end
