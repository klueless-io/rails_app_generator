# frozen_string_literal: true

# factory_bot provides a framework and DSL for defining and using factories - les eror-prone, more explicit, and al-around easier to work with than fixtures.
#
# exe/rag addons/factory_bot

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

after_bundle do
  create_db
  scaffolds
  setup_customizations
  migrate_db
end

def scaffolds
  # add_scaffold('post', 'title', 'body:text', 'user:references')
  # add_scaffold('people', 'first_name', 'last_name', 'age:integer', 'address:text')
  # add_scaffold('product', 'name', 'price:integer')
end

def setup_customizations
  route("root 'home#index'")

  force_copy
  
  add_controller('home', 'index')
  
  directory "app/controllers"
  directory "app/models"
  directory "app/views"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
  directory "app/services"
end

def create_db
  # uncomment this if you need custom configuration in database.yml
  # gsub_file('config/database.yml', '  encoding: unicode', db_development_settings)
  db(drop: true, create: true)
end

def migrate_db
  template  'db/seeds.rb'                                   , 'db/seeds.rb'

  db(migrate: true, seed: true)
end

def db_development_settings
  <<-'RUBY'
  encoding: unicode
  host: 127.0.0.1
  username: printspeak
  password: printspeak
  RUBY
end
