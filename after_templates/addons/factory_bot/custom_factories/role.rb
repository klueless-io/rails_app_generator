FactoryBot.define do
  factory :role do
    code { 'user' }

    trait :contributor do
      code { 'contributor' }
    end

    trait :moderator do
      code { 'moderator' }
    end

    trait :admin do
      code { 'admin' }
    end

    # factory :contributor_role , traits: [:contributor]
    # factory :moderator_role   , traits: [:moderator]
    # factory :admin_role       , traits: [:admin]
  end
end
