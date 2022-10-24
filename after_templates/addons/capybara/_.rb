# frozen_string_literal: true

# Capybara is an integration testing tol for rack based web applications. It simulates how a user would interact with a website
#
# exe/rag addons/capybara

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

after_bundle do
  create_db
  setup_customizations
  migrate_db
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

def create_db
  db(drop: true, create: true)
end

def migrate_db
  db(migrate: true, seed: false)
end
