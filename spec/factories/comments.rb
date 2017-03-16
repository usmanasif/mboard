FactoryGirl.define do
  factory :comment do
    sequence(:body) { |i| "comment##{i}" }
  end
end
