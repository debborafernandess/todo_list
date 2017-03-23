FactoryGirl.define do
  factory :list do
    name Faker::Name.title
    user
  end

  trait :public do
    private_visibility false
  end

  trait :private do
    private_visibility true
  end
end
