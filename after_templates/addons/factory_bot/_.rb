# frozen_string_literal: true

# factory_bot provides a framework and DSL for defining and using factories - less error-prone, more explicit, and all-around easier to work with than fixtures.
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

# Goals:
# - Store Factories in subfolder under spec
# -
# - Use the faker GEM with both standard and custom data
# - Custom data goes in custom locales folder, see: https://stackoverflow.com/questions/28153540/extending-faker-in-a-gem-where-do-i-put-the-yaml-file
# - Use associations to affectively create related records
# - Create default and NULL factory example
# - Create Seed Data services
# - Add support for STI
# - Add support for polymorphic associations
# Things to be aware of in faker
# - Random focused data is better then sequence
#   sequence(:name) { |n| "Category #{n}" }
#   vs
#   name { Faker::Hipster.word }
# - 


def scaffolds
  add_scaffold('app', 'title', 'description', 'settings:json')
  add_scaffold('tenant', 'name', 'slug', 'active:boolean', 'app:references')
  add_scaffold('role', 'code') # contributor, moderator, admin
  add_scaffold('employee', 'first_name', 'last_name', 'address:text', 'email', 'password', 'tenant:references', 'role:references')
  add_scaffold('project', 'name', 'status', 'budget:decimal', 'country', 'progress:integer', 'tenant:references')
  add_scaffold('article', 'title', 'body:text', 'is_featured:boolean', 'employee:references', 'tenant:references')
  add_scaffold('video', 'title', 'youtube_id', '', 'article:references')
end

def setup_customizations
  route("root 'home#index'")

  force_copy
  
  add_controller('home', 'index', 'reseed')

  directory "app/controllers"
  directory "app/models"
  directory "app/views"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
  directory "app/services"
  copy_file 'factories.rb'
end

def create_db
  # uncomment this if you need custom configuration in database.yml
  # gsub_file('config/database.yml', '  encoding: unicode', db_development_settings)
  db(create: true)
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
