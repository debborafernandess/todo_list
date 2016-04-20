FactoryGirl.define do
  factory :list do
    association         :user
    name                Faker::Name.title
    private_visibility  false
  end
end
