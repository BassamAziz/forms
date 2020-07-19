FactoryBot.define do
  factory :custom_datum do
    association :custom_attribute
    content { 'content' }

    trait :user do
      association :customizable, factory: :user
    end

    trait :profile do
      association :customizable, factory: :profile
    end

    trait :event_registration do
      association :customizable, factory: :event_registration
    end
  end
end
