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

def scaffolds
  add_scaffold('region', 'name', 'settings:json')
  add_scaffold('company', 'name', 'slug', 'active:boolean', 'region:references')
  add_scaffold('role', 'code', 'description') # contributor, moderator, admin
  add_scaffold('employee', 'first_name', 'last_name', 'address:text', 'email', 'password', 'company:references')
  add_scaffold('employee_role', 'employee:references', 'role:references')
  add_scaffold('project', 'name', 'status', 'budget:decimal', 'country', 'progress:integer', 'company:references')
  add_scaffold('article', 'title', 'body:text', 'is_featured:boolean', 'published:datetime', 'employee:references', 'company:references')
  add_scaffold('video', 'title', 'youtube_id', '', 'article:references')
  add_scaffold('reserved', 'new', 'do', 'end')
end

# https://speakerdeck.com/toshimaru/factorybot-the-right-way
def setup_customizations
  route("root 'home#index'")

  force_copy
  
  add_controller('home', 'index', 'test_data', 'sample_data')

  directory "app/controllers"
  directory "app/models"
  directory "app/views"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
  directory "app/services"
  directory 'config'
  directory 'custom_factories'
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
