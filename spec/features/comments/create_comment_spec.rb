# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Comment' do
  let(:user) { create(:user) }
  let(:article) { create(:article) }
  let(:valid_comment) { 'comment with valid params' }
  let(:invalid_comment) { 'hi' }

  before do
    sign_in user
    visit article_path(article)
  end

  feature 'Create Comment' do
    scenario 'Create Comment with correct params' do
      fill_in 'comment_body', with: valid_comment
      click_button 'Отправить'

      section = find_by_id('comments-row')

      expect(section).to have_content user.first_name
      expect(section).to have_content user.last_name
      expect(section).to have_content valid_comment
    end

    scenario 'Create Comment with incorrect params' do
      fill_in 'comment_body', with: invalid_comment
      click_button 'Отправить'

      expect(page).to have_content 'Body is too short (minimum is 5 characters)'
    end
  end
end
