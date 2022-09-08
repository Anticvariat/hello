# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    commenter { 'rspec' }
    body { 'rspeccomment' }
    article_id { 1 }
  end
end
