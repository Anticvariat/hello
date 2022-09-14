# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :article do
    title { Faker::String.random(length: 10..15) }
    body { Faker::String.random(length: 15..20) }
    status { 'public' }
    user factory: :user
  end
end
