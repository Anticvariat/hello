# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :comment do
    body { Faker::String.random(length: 15..20) }
    user factory: :user
    article factory: :article
  end
end
