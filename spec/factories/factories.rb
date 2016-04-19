FactoryGirl.define do
  factory :list do
    association         :user
    name                Faker::Name.title
    private_visibility  false
  end

  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    name      Faker::Name.name
    password  Faker::Internet.password
  end
end
