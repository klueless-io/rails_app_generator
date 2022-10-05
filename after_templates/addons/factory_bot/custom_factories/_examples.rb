def examples
  # description { Faker::Lorem.paragraphs(number: rand(1...3)).join("\n") }
  Faker::Name.name
  Faker::Name.unique.name
  Faker::Name.unique.first_name
  Faker::Name.unique.last_name
  
  Faker::Hacker.unique.say_something_smart
  Faker::String.unique.troublesome

  Faker::Lorem.unique.sentences.join(' ')
  Faker::Lorem.unique.words.join(' ')
  Faker::Lorem.unique.characters(10)
  Faker::Lorem.unique.paragraphs.join("\n\n")

  Faker::Internet.email
  Faker::Internet.unique.user_name
  Faker::Internet.unique.url
  Faker::Internet.unique.ip_v4_address

  Faker::Number.unique.between(1, 10_000)
  Faker::Number.unique.decimal(4, 2)

  Faker::Company.catch_phrase
  Faker::Company.buzzword
  # When a straight answer won't do, BS to the rescue!
  Faker::Company.bs
  Faker::Company.logo #=> "https://pigment.github.com/fake-logos/logos/medium/color/5.png"
  Faker::Company.profession #=> "firefighter"
  Faker::Company.australian_business_number #=> "81137773602"

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
