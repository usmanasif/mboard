FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.org" }
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    password 'pass123456'
    password_confirmation 'pass123456'
  end
end
