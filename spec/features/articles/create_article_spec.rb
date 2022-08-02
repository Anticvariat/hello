# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Article' do
  let(:user) { create(:user) }

  context 'create Article' do
    it 'is valid' do
      sign_in user
      visit new_article_path
      fill_in 'Title', with: 'test'
      fill_in 'Body', with: 'example article'
      click_button 'Create Article'
      expect(page).to have_content 'К моим статьям'
    end
  end
end
