# frozen_string_literal: true

class SeedService
  class << self
    def seed(variant: :reset)
      service = SeedService.new
      service.call(variant: variant)
    end
  end

  NAMES = %w[
    Adyson Aimee Aisha Akira Alani Albert Aleah Aleena Alena Alexus Alfred Ali Alia
    Amelie Amina Amirah Amiya Anabella Anabelle Andrew Angeline Angelique Ann Annabel Aliana
    Armani Arthur Aryana Ashanti Ashleigh Ashly Aspen Averie Avery Ayana Barbara
    Brynlee Cailyn Cal Camilla Campbell Carina Carissa Carlee Carley Carlie Carolyn Cassie
    Charlie Charlize Chaya Cherish Cierra Clair Clare Clarence Cloe Corinne Cristal
    Destiney Dominique Dorsey Early Edith Edward Eileen Elaine Elisa Ellen Elmer Elsa Elsie
    Fay Felicity Finley Frances Frank Fred Frederick Frida Gemma George Gia Giada Giana Gillian
    Hana Harris Harry Haven Henderson Henry Herbert Hezekiah Hillary Iliana India
    James Jamya Janae Janet Janiah Jaslyn Jaycee Jaylah Jaylee Jaylen Jaylene Jaylyn
    John Johnie Joseph Joslyn Joyce Judith Julianne June Kaia Kaila Kailee Kaiya Kaley
    Karma Kasey Katrina Kaya Kaylen Kayley Kaylyn Keely Kelsie Kendal Kenna Keyla Kierra
    Leanna Lewis Leyla Libby Lilianna Lillianna Lilyana Lina Litzy Lizeth Lonzo Lorelai
    Maeve Magdalena Maia Makena Maleah Maliyah Mara Mareli Mariam Marianna Mariela Marisa
    Miah Micah Milagros Mina Mira Mollie Monique Monserrat Mont Moriah Mylie Natalya
    Paloma Pamela Patience Paula Peter Phoenix Precious Raelynn Raina Raven Rayna Rayne Regan
    Rollin Roselyn Rosemary Roy Ryann Saige Salma Sam Samuel Sanaa Sanai Sarahi Sariah Savanah
    Shyann Shyanne Shyla Siena Sonia Stacy Stephany Susan Taliyah Tamara Taniya Taniyah
    Tianna Tom Valery Walter Will William Willie Wilmer Xiomara Yadira Yamilet Yaritza Yasmine Yazmin
    Yoselin Yuliana Zaniyah Zara Zaria Zion
    %
  ].freeze

  attr_reader :au, :us, :gb, :monuments

  def call(variant: :reset)
    reset     if variant == :reset
    refresh   if variant == :refresh
    create
  end

  private

  def reset
    Visitor.delete_all
    Monument.delete_all
    Country.delete_all
  end

  def refresh
    Visitor.delete_all
  end

  def create
    upsert_countries
    upsert_monuments
    create_visitors
  end

  def upsert_countries
    @au = Country.create_with(name: 'Australia').find_or_create_by(code: 'AU')
    @us = Country.create_with(name: 'United States').find_or_create_by(code: 'US')
    @gb = Country.create_with(name: 'United Kingdom').find_or_create_by(code: 'GB')
  end

  def upsert_monuments
    @monuments = [
      Monument.create_with(country: au,
                           description: 'The Sydney Opera House is a multi-venue performing arts centre in Sydney, New South Wales, Australia. It is the largest performing arts centre in Australia and the second largest in the world.')
              .find_or_create_by(name: 'Sydney Opera House'),
      Monument.create_with(country: au,
                           description: 'The Sydney Harbour Bridge is a viaduct bridge in Sydney, New South Wales, Australia. It is the longest viaduct bridge in Australia and the second longest in the world.')
              .find_or_create_by(name: 'Sydney Harbour Bridge'),
      Monument.create_with(country: au,
                           description: 'The Big Banana is a large, round, fruit-bearing tree in the Australian bushland of the Great Barrier Reef. It is the largest tree in the world.')
              .find_or_create_by(name: 'The Big Banana'),
      Monument.create_with(country: us,
                           description: 'The Statue of Liberty is a colossal neoclassical sculpture on Liberty Island in New York Harbor, New York, in the United States. The statue was a gift from the people of France to the people of the United States in 1886.')
              .find_or_create_by(name: 'Statue of Liberty'),
      Monument.create_with(country: us,
                           description: 'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean. The bridge was completed in 1937.')
              .find_or_create_by(name: 'Golden Gate Bridge'),
      Monument.create_with(country: us,
                           description: 'The Empire State Building is a 102-story skyscraper in Midtown Manhattan, New York City. It is the world\'s tallest building, a structure that is the 4th-tallest building in the world.')
              .find_or_create_by(name: 'Empire State Building'),
      Monument.create_with(country: gb,
                           description: 'The Tower of London is a historic London tower on the north bank of the River Thames in central London. It is the most-visited paid monument in the world.')
              .find_or_create_by(name: 'Tower of London'),
      Monument.create_with(country: gb, description: 'The Big Ben is a clock tower in the north of London. It is the world\'s tallest clock tower.')
              .find_or_create_by(name: 'Big Ben'),
      Monument.create_with(country: gb,
                           description: 'The London Eye is a giant Ferris wheel situated on the South Bank of the River Thames in London, England. It is the world\'s largest Ferris wheel.')
              .find_or_create_by(name: 'London Eye')
    ]
  end

  def create_visitors
    NAMES.each do |name|
      rand(1..10).times do # number monuments to visited (duplicates are fine)
        Visitor.create(name: name, monument: monuments.sample)
      end
    end
  end
end
