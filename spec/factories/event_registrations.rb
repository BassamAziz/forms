FactoryBot.define do
  factory :event_registration do
    sequence(:email) { |n| "person#{n}@example.com" }
    association :event
  end
end
