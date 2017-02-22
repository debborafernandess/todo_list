FactoryGirl.define do
  factory :task do
    association :list
    title Faker::Name.name
  end
end
