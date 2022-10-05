FactoryBot.define do
  factory :article do
    title { Faker::Quote.famous_last_words }
    body { Faker::Lorem.paragraphs(number: rand(4...10)).join("\n") }
    is_featured { [true, false].sample }
    published { rand(1..10) > 8 ? nil : rand(1..20).days.ago }
    # employee { nil }
    # tenant { nil }
    trait :unpublished do
      published { nil }
    end
  end
end
