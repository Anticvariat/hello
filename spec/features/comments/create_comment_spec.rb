# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Comment' do
  NEW_COMMENT_BODY = 'comment with valid params'
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  before do
    sign_in user
    visit article_path(article)
  end

  feature 'Create Comment' do
    scenario 'Create Comment with correct params' do
      fill_in 'comment_body', with: NEW_COMMENT_BODY
      click_button 'Отправить'

      section = find_by_id('comments-row')
      
      expect(section).to have_content user.first_name
      expect(section).to have_content user.last_name
      expect(section).to have_content NEW_COMMENT_BODY
    end
  end
end
