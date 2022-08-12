# frozen_string_literal: true

# Administrate is inspired by Rails Admin and ActiveAdmin, but aims to provide a better developer/user experience.
#
# exe/rag addons/administrate

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

add_controller('home', 'index')

route("root 'home#index'")

force_copy

directory "app/controllers"
directory "app/views/home"
directory "app/views/layouts"
template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'

template  'db/seeds.rb'                                   , 'db/seeds.rb'

after_bundle do
  setup_db

  generate('administrate:install')
  
  directory "app/dashboards"
end

def setup_db
  add_scaffold('author', 'name:string email:string bio:text')
  add_scaffold('post', 'title:string content:text published:boolean author:references')
  add_scaffold('product', 'name', 'quantity:integer', 'price:decimal')

  directory "app/models"

  db_migrate
  db_seed
end
