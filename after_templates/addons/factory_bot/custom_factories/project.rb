FactoryBot.define do
  factory :project do
    name { Faker::App.name }
    status { %i[closed rejected failed loading running waiting done finalized archived finished].sample }
    budget { Faker::Number.decimal(l_digits: 4) }
    country { Faker::Address.country_code }
    progress { Faker::Number.between(from: 0, to: 100) }
    # tenant { nil }
  end
end
