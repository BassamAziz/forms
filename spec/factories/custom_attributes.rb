FactoryBot.define do
  factory :custom_attribute do
    name { 'custom string' }
    required { false }

    trait :boolean do
      data_type { :boolean }
    end

    trait :text do
      data_type { :text }
    end

    trait :user do
      source { :user }
    end

    trait :profile do
      source { :profile }
    end

    trait :event do
      source { :event_registration }
    end
  end
end