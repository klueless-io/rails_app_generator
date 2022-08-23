# frozen_string_literal: true

# Provides Rails integration for factory_bot
#
# exe/rag addons/factory_bot_rails

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

after_bundle do
  scaffolds
  setup_customizations
  setup_db
end

def scaffolds
  add_scaffold('post', 'title', 'body:text', 'is_featured:boolean')
  add_scaffold('person', 'first_name', 'last_name', 'email', 'password', 'address:text')
  add_scaffold('project', 'name', 'status', 'budget:decimal', 'country', 'progress:integer')
end

def setup_customizations
  route("root 'home#index'")

  force_copy
  
  add_controller('home', 'index', 'reseed')
  
  directory "app/controllers"
  directory "app/models"
  directory "app/services"
  directory "app/views"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
  copy_file 'factories.rb', 'factories.rb'
end

def setup_db
  template  'db/seeds.rb'                                   , 'db/seeds.rb'

  db_migrate
  db_seed
end
