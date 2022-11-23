# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contact me', js: true do
  let(:user) { create(:user) }
  let(:admin) { create(:user, email: ENV.fetch('GMAIL_USERNAME', 'admin@example.example')) }
  let(:message) { 'hello message from capybara' }

  before do
    sign_in user
    visit about_me_contact_me_path
  end

  feature 'Send mail to admin' do
    scenario 'With correct params' do
      fill_in 'message_body', with: message
      click_button 'Отправить'

      expect(page).to have_current_path '/'

      visit all_articles_path
      open_email(admin.email)

      expect(current_email.body).to have_content("User #{user.first_name} with email #{user.email} sent you a message!")
      expect(current_email.body).to have_content message
      expect(current_email.body).to have_content('Go to the link to return at your page -> Link.')
    end
  end
end
