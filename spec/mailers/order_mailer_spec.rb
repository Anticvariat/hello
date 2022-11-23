# frozen_string_literal: true

require 'rails_helper'

describe OrderMailer do
  describe '.contact-me-mail' do
    let(:user) { build(:user) }
    let(:mail) { described_class.contact_me_mail(user, { message_body: message }) }
    let(:message) { 'hi from rspec unit test' }
    let(:host) { ENV.fetch('HELLO_HOST', 'localhost:3000') }

    before do
      mail.deliver_now
    end

    context 'with valid params' do
      it 'is valid' do
        expect(mail.body).to have_content user.first_name
        expect(mail.body).to have_content user.email
        expect(mail.body).to have_content message
        expect(mail.body).to have_content 'Link'
        expect(mail.body).to have_link("Link", href: ENV.fetch('HELLO_HOST', 'http://localhost:3000'))
      end
    end
  end
end
