FactoryBot.define do
  factory :region do
    name { Faker::Australia.location } # Faker::App.name
    settings { Faker::Json.shallow_json(width: 3, options: { key: 'Name.first_name', value: 'Name.last_name' }) }

    # These traits are used to define well known variations of a factory
    trait :western_sydney do
      name { 'Western Sydney' }
      settings { { 'suburbs' => ['Blacktown', 'Parramatta', 'Penrith', 'Campbelltown', 'Liverpool'] } }
    end

    trait :sydney do
      name { 'Sydney CBD' }
      settings { { 'suburbs' => ['Sydney', 'Sydney CBD', 'Surry Hills', 'Darling Harbour', 'Barangaroo'] } }
    end

    trait :eastern_suburbs do
      name { 'Eastern Suburbs' }
      settings { { 'suburbs' => ['Bondi', 'Bondi Beach', 'Bondi Junction', 'Bronte', 'Coogee', 'Darlinghurst'] }}
    end

    trait :inner_west do
      name { 'Inner West' }
      settings { { 'suburbs' => ['Ashfield', 'Burwood', 'Campsie', 'Croydon', 'Newtown'] } }
    end

    trait :north_shore do
      name { 'North Shore' }
      settings { { 'suburbs' => ['Pymble', 'Castle Cove', 'Castlecrag', 'Chatswood', 'Crows Nest', 'Cremorne'] } }
    end
  end
end
