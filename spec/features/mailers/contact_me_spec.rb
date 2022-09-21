# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Send message to application owner', js:true do
  VALID_MESSAGE_BODY = 'hi from rspec'
  let(:user) { create(:user) }

  feature 'Send email' do
    scenario 'Succesfull email send' do
      sign_in user
      visit about_me_contact_me_path
      fill_in 'message_body', with: VALID_MESSAGE_BODY
      click_button 'Отправить'
      open_email(user.email)
      expect(current_email).to have_content VALID_MESSAGE_BODY
    end
  end
end
