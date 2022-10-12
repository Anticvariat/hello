# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Tea.variety }
    body { "My favorite tea is #{title}" }
    status { 'public' }
    user factory: :user
  end
end
