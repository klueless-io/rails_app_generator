# frozen_string_literal: true

# Ads methods to ActiveRecord:Migration to create and manage database views in Rails
#
# exe/rag addons/scenic

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

after_bundle do
  force_copy
  
  create_db
  scaffolds
  setup_customizations
  migrate_db
end

def scaffolds
  add_scaffold('country', 'code', 'name')
  add_scaffold('monument', 'name', 'description', 'country:references')
  add_scaffold('visitor', 'name', 'monument:references')

  generate('scenic:model visitors_by_monument')
  generate('scenic:model individual_visitors_by_monument --materialized')

  directory "db/views"
end

def setup_customizations
  route("root 'home#index'")

  add_controller('home', 'index', 'visitors_by_monument', 'individual_visitors_by_monument', 'reseed', 'refresh_material_view')

  directory "app/controllers"
  directory "app/models"
  directory "app/views"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
  directory "app/services"
end

def create_db
  gsub_file('config/database.yml', '  encoding: unicode', db_development_settings)
  rails_command('db:environment:set RAILS_ENV=development')
  db(drop: true, create: true)
end

def migrate_db
  template  'db/seeds.rb'                                   , 'db/seeds.rb'

  db(migrate: true, seed: true)
end

def db_development_settings
  <<-'RUBY'
  encoding: unicode
  host: <%= ENV['DATABASE_HOST'] %>
  username: <%= ENV['DATABASE_USERNAME'] %>
  password: <%= ENV['DATABASE_PASSWORD'] %>
  RUBY
end
