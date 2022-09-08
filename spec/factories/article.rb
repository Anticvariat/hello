# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'rspec' }
    body { 'rspecarticle' }
    status { 'public' }
    user_id { '1' }
  end
end
