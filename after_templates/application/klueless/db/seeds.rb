@data_path = "/Users/davidcruwys/dev/printspeak/printspeak-generator/.builders/.data/"

david = User.create_with(name: 'david', password: 'password').find_or_create_by(email: 'david@site.com')

def get_data(filename)
  json = File.read(File.join(@data_path, filename))
  JSON.parse(json)
end

rails_app = RailsApp.create(name: 'Printspeak', user: david)

puts 'Create Rubocop Data'
Rubocop.create(rails_app: rails_app, data: get_data('rubocop.json'))

puts 'Create Table Count Data'
TableCount.create(rails_app: rails_app, data: get_data('sql_count.json'))


