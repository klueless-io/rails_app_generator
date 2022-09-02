# frozen_string_literal: true

class SeedService
  PRINTSPEAK_DATA_PATH = "/Users/davidcruwys/dev/printspeak/printspeak-generator/.builders/.data/"

  class << self
    def seed(variant: :reset)
      service = SeedService.new
      service.call(variant: variant)
    end
  end

  def call(variant: :reset)
    reset     if variant == :reset
    refresh   if variant == :refresh
    create
  end

  private

  def get_data(filename)
    json = File.read(File.join(PRINTSPEAK_DATA_PATH, filename))
    JSON.parse(json)
  end

  def reset
    User.delete_all
    RailsApp.delete_all
    Rubocop.delete_all
    TableCount.delete_all
  end

  def refresh
  end

  def create
    refresh_printspeak

    RubocopLog.refresh
  end

  def refresh_printspeak
    david = User.create_with(name: 'david', password: 'password').find_or_create_by(email: 'david@site.com')

    rails_app = RailsApp.create_with(user: david).find_or_create_by(name: 'Printspeak')

    puts 'Create Rubocop Data'
    Rubocop.create(rails_app: rails_app, data: get_data('rubocop.json'))

    puts 'Create Table Count Data'
    TableCount.create(rails_app: rails_app, data: get_data('sql_count.json'))
  end
end
