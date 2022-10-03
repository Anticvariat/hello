# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'factorybot article title' }
    body { 'factorybot article body' }
    status { 'public' }
    user factory: :user
  end
end
