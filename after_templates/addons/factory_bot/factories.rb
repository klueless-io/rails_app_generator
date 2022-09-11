FactoryBot.define do
  factory :app do
    title { Faker::Name.name } # Faker::App.name
    description { Faker::Lorem.paragraphs(number: rand(4...10)).join("\n") }
    settings { { 'foo' => 'bar' } }
  end

  factory :tenant do
    name { Faker::Name.name }
    slug { Faker::Internet.slug }
    active { [true, false].sample }
    app
  end

  factory :employee do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    address { Faker::Address.full_address }
  end

  factory :article do
    title { Faker::Quote.famous_last_words }
    body { Faker::Lorem.paragraphs(number: rand(4...10)).join("\n") }
    is_featured { [true, false].sample }
  end

  factory :project do
    name { Faker::App.name }
    status { [:closed, :rejected, :failed, :loading, :running, :waiting, :done, :finalized, :archived, :finished].sample }
    budget { Faker::Number.decimal(l_digits: 4) }
    country { Faker::Address.country_code }
    progress { Faker::Number.between(from: 0, to: 100) }
  end
end

def examples
  Faker::Name.name
  Faker::Name.unique.name

  Faker::Internet.email

  Faker::Artist.name
  Faker::Address.city #=> "Imogeneborough"
  Faker::Address.street_name #=> "Larkin Fork"
  Faker::Address.street_address #=> "282 Kevin Brook"
  Faker::Address.secondary_address #=> "Apt. 672"
  Faker::Address.building_number #=> "7304"
  Faker::Address.mail_box #=> "PO Box 123"
  Faker::Address.community #=> "University Crossing"
  Faker::Address.zip_code #=> "58517" or "23285-4905"
  Faker::Address.zip #=> "58517" or "66259-8212"
  Faker::Address.postcode #=> "76032-4907" or "58517"
  Faker::Address.time_zone #=> "Asia/Yakutsk"
  Faker::Address.street_suffix #=> "Street"
  Faker::Address.city_suffix #=> "fort"
  Faker::Address.city_prefix #=> "Lake"
  Faker::Address.state #=> "California"
  Faker::Address.state_abbr #=> "AP"
  Faker::Address.country #=> "French Guiana"

  # Keyword arguments: code
  Faker::Address.country_by_code(code: 'NL') #=> "Netherlands"

  # Keyword arguments: name
  Faker::Address.country_name_to_code(name: 'united_states') #=> "US"
  Faker::Address.country_code #=> "IT"
  Faker::Address.country_code_long #=> "ITA"
  Faker::Address.latitude #=> "-58.17256227443719"
  Faker::Address.longitude #=> "-156.65548382095133"
  Faker::Address.full_address #=> "282 Kevin Brook, Imogeneborough, CA 58517"
end
