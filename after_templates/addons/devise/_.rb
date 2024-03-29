# frozen_string_literal: true

# Based on guidance from:
#   Rails 7 - Intro to Devise
#   https://www.youtube.com/watch?v=m3uhldUGVes
#
# exe/rag addons/devise

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

after_bundle do
  scaffolds
  setup_customizations
  setup_db
end

def scaffolds
  add_scaffold('post', 'title', 'body:text', 'views:integer', 'user:references')
end

def setup_db
  template  'db/seeds.rb'                                   , 'db/seeds.rb'

  db_migrate
  db_seed
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
