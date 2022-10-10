# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Article' do
  let(:article) { create(:article, status: 'draft') }

  feature 'Open Article' do
    scenario 'when the article is a draft' do
      visit article_path(article)

      expect(page).to have_content('Access denied')
      expect(page).to have_content('Содержимое недоступно')
    end
  end
end
