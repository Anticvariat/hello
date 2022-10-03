# frozen_string_literal: true

require 'rails_helper'

describe OrderMailer do 
  describe '.contact-me-mail' do
  	let(:user) { build(:user) }
  	let(:mail) { described_class.contact_me_mail(user).deliver_now }
  	context 'with valid params' do
  	  it 'is valid' do
  	  	p mail
  	  	expect(mail.to).not_to eq(nil)
  	  end
  	end
  end
	
end