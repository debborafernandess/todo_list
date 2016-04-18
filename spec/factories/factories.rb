FactoryGirl.define do
  factory :list do
    association         :user
    name                Faker::Name.title
    private_visibility  false
end

factory :user do
  email     Faker::Internet.email
  name      Faker::Name.name
  password  Faker::Internet.password
  end
end
