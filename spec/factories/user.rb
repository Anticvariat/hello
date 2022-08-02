FactoryBot.define do
  factory :user do
    email { "example@example.ru" }
    password { "123456" }
    first_name { "John" }
    last_name  { "Doe" }
  end
end