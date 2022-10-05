FactoryBot.define do
  factory :video do
    title { Faker::Movie.title }
    youtube_id { Faker::Barcode.ean }
    # article { nil }
  end
end
