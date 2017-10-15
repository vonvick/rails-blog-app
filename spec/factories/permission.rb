FactoryGirl.define do
  factory :permission do
    trait :can_delete do
      title 'delete'
      description 'Can delete blogs and comments'
    end

    trait :can_edit do
      title 'edit'
      description 'can delete blogs and comments'
    end

    trait :for_member do
      title 'members'
      description 'for members only'
    end

    trait :for_private do
      title 'private'
      description 'can view private blogs'
    end
  end
end