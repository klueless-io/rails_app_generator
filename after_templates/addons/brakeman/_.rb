# frozen_string_literal: true

# Brakeman is a static analysis security vulnerability scanner for Ruby on Rails applications
#
# exe/rag addons/brakeman

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

after_bundle do
  scaffolds
  setup_customizations
  setup_db
end

def scaffolds
  add_scaffold('post', 'title', 'body:text')
end

def setup_customizations
  route("root 'home#index'")

  force_copy
  
  add_controller('home', 'index', 'examples', 'output')
  
  directory "app/controllers"
  directory "app/models"
  directory "app/views"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
end

def setup_db
  db_migrate
  db_seed
end
