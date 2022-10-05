FactoryBot.define do
  factory :company do
    active { [true, false].sample }
    name { Faker::Name.name }
    slug { Faker::Internet.slug }
    # region
    # region { nil }
  end
end
