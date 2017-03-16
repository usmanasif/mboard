FactoryGirl.define do
  factory :post do
    sequence(:title) { |i| "Title##{i}" }
    body { Faker::Lorem.paragraph(40) }
  end
end
