FactoryBot.define do
  # Attach factory name to a class, similar outcome to using aliases
  factory :user, class: "Employee"  do
    active { [true, false].sample }
    name { 'User 1' }
    slug { 'user-1' }
    # region
    # # region { nil }
  end
end
