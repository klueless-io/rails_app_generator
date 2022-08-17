# frozen_string_literal: true

# Log in as another user in Rails
#
# exe/rag addons/pretender

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

after_bundle do
  setup_customizations
  setup_db
end

def setup_customizations
  route("root 'home#index'")

  force_copy
  
  add_controller('home', 'index')
  
  directory "app/controllers"
  directory "app/models"
  directory "app/views"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
end

def setup_db
  template  'db/seeds.rb'                                   , 'db/seeds.rb'

  db_migrate
  db_seed
end
