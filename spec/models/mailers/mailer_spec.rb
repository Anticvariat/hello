# frozen_string_literal: true

require 'rails_helper'

describe OrderMailer do 
  MAILER_MESSAGE = 'hi from rspec unit test'

  describe '.contact-me-mail' do
  	let(:user) { build(:user) }
  	let(:mail) { described_class.contact_me_mail(user, {message_body: MAILER_MESSAGE}).deliver_now}

  	context 'with valid params' do
  	  it 'is valid' do
  	  	p mail.body

  	  	expect(mail).to have_content user.first_name
  	  	expect(mail.body).to have_content(user.first_name)
  	  	expect(mail.body).to have_content(user.email)
  	  	expect(mail.body).to have_content(MAILER_MESSAGE)
  	  end
  	end
  end
	
end