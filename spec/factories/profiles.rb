FactoryBot.define do
  factory :profile do
    association :user
    name { 'john' }
  end
end
