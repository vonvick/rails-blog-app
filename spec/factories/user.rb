FactoryGirl.define do
  factory :user do
    trait :admin_user do
      firstname 'saitama'
      lastname 'yamaha'
      username 'yokozuna112'
      email 'admin_user@example.com'
      password 'password5673'
    end

    trait :moderator_user do
      firstname 'shinji'
      lastname 'ono'
      username 'shiji187'
      email 'moderator_user@example.com'
      password 'password234'
    end

    trait :regular_user do
      firstname 'suzuki'
      lastname 'miyamoto'
      username 'kagawa345'
      email 'regular_user@example.com'
      password 'password345'
    end
  end
end