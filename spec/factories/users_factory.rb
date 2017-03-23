FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    name      Faker::Name.name
    password  Faker::Internet.password
  end
end
