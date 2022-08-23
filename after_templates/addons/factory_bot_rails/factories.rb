FactoryBot.define do
  # add_scaffold('post', 'title', 'body:text', 'is_featured:boolean')
  # add_scaffold('person', 'first_name', 'last_name', 'email', 'password', 'is_featured:boolean', 'address:text')
  # add_scaffold('project', 'status', 'budget:decimal', 'country', 'progress:integer')

  factory :person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    address { Faker::Address.full_address }
  end

  factory :post do
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
