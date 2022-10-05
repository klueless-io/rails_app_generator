FactoryBot.define do
  factory :employee do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    address { Faker::Address.full_address }
    role # { %i[role_contributor role_moderator role_admin].sample }
    # tenant { nil }
    # role { nil }

    # trait :contributor do
    #   role :contributor_role
    # end

    # trait :moderator do
    #   role :moderator_role
    # end

    # trait :admin do
    #   role :admin_role
    # end

    # factory :contributor_user , traits: [:contributor]
    # factory :moderator_user   , traits: [:moderator]
    # factory :admin_user       , traits: [:admin]

  end

  # factory :employee do
  #   first_name { "MyString" }
  #   last_name { "MyString" }
  #   address { "MyText" }
  #   email { "MyString" }
  #   password { "MyString" }
  # end
end
