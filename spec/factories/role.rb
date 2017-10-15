FactoryGirl.define do
  factory :role do
    trait :admin do
      title 'admin'
      description 'admin role'
    end

    trait :moderator do
      title 'moderator'
      description 'moderator role'
    end

    trait :regular do
      title 'regular'
      description 'regular role'
    end
  end
end