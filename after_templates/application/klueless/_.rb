# frozen_string_literal: true

# No Code as a Service Rails Application Builder
#
# exe/rag application/klueless

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

after_bundle do
  force_copy
  create_db
  scaffolds
  setup_avo
  setup_customizations
  migrate_db

  swap1 = '  resources :users'
  swap2 = "  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }"

  swap_lines('config/routes.rb', swap1, swap2)
end

def scaffolds
  add_scaffold_controller('users', 'name', 'email')

  add_scaffold('rails_app', 'name', 'user:references') # name of the rails_app

  # no of records in each table per region
  add_scaffold('table_count', 'data:jsonb', 'rails_app:references')
  # add_scaffold('table_count_table', 'name', 'region', 'count:integer', 'table_count:references')

  # rubocop logs
  add_scaffold('rubocop', 'data:jsonb', 'rails_app:references') # import_date is known as created_at

  # database schema
  add_scaffold('db_schema', 'data:jsonb', 'rails_app:references')
  # add_scaffold('db_schema_table', 'name', 'primary_key', 'primary_key_type', 'db_schema:references')

  # add_scaffold('db_schema_column', 'name', 'type', 'precision:integer', 'scale:integer', 'default', 'array:boolean', 'null:boolean', 'limit:integer', 'db_schema_table:references')
  # add_scaffold('db_schema_foreign_key', 'left', 'right', 'name', 'on_update', 'on_delete', 'column', 'db_schema_table:references')
  # add_scaffold('db_schema_index', 'name', 'fields', 'using', 'order:jsonb', 'where', 'unique', 'db_schema_table:references')
  # add_scaffold('db_schema_view', 'name', 'materialized:boolean', 'sql_definition', 'db_schema_table:references')

  generate('scenic:model rubocop_entry --materialized')
end

def setup_customizations
  route("root 'home#index'")

  force_copy
  
  add_controller('home', 'index', 'quick_signin', 'reseed', 'refresh_material_view')
  
  directory "app/controllers"
  directory "app/models"
  directory "app/views"
  template  'app/views/layouts/application.html.erb', 'app/views/layouts/application.html.erb'
  directory "app/queries"
  directory "app/services"
  directory "db/views" # takes views from both scaffolds and customizations

  copy_file '.rubocop.yml', '.rubocop.yml'
end

def setup_avo
  generate('avo:resource rails_app')
  generate('avo:resource table_count')
  generate('avo:resource rubocop')
  generate('avo:resource rubocop_entry')
  generate('avo:resource db_schema')
  generate('avo:resource user')

  generate('avo:resource_tool rubocop_info')
  generate('avo:filter rubocop_entry_filter')

  # generate('avo:dashboard Dashboard')

  directory "app/avo"
  directory "config/initializers"
  directory "config/locales"
end

def create_db
  gsub_file('config/database.yml', '  encoding: unicode', db_development_settings)
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
