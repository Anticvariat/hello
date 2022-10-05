# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Draft' do
  let(:user) { build(:user) }
  let(:user2) { build(:user) }
  let(:article) { create(:article, user: user, status: 'draft') }

  feature 'Open draft' do
    scenario 'When the user is not logged in' do
      visit article_path(article)

      expect(page).to have_content('Access denied')
      expect(page).to have_content('Содержимое недоступно')
    end

    scenario 'When the user is logged in and the article is his' do
      sign_in user
      visit article_path(article)

      expect(page).to have_content article.title
      expect(page).to have_content article.body
      expect(page).to have_content('Статус: черновик')
    end

    scenario 'When the user is logged in, but the article is not his' do
      sign_in user2
      visit article_path(article)

      expect(page).to have_content('Access denied')
      expect(page).to have_content('Содержимое недоступно')
    end

  end
end
