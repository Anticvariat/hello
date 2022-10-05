# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contact me', js: true do
  MESSAGE = 'hello message from capybara'

  let(:user) { create(:user) }
  let(:admin) { create(:user, email: ENV.fetch('GMAIL_USERNAME', 'admin@example.example'))}

  feature 'Send mail to admin' do
    scenario 'With correct params' do
      sign_in user

      visit about_me_contact_me_path

      fill_in 'message_body', with: MESSAGE
      click_button 'Отправить'

      expect(page).to have_current_path '/'

      open_email(admin.email)

      expect(current_email).to have_content user.first_name
      expect(current_email).to have_content user.email
      expect(current_email).to have_content MESSAGE
    end
  end
end
