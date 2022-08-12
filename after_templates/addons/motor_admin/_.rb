# frozen_string_literal: true

# Motor Admin allows to create a flexible admin panel while writing less code.
#
# exe/rag addons/motor_admin

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

bundle_install

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

  generate('motor:install')
  db_migrate
  # generate('administrate:install')
  
  # directory "app/dashboards"

  rubocop
end

def setup_db
  add_scaffold('author', 'name:string email:string bio:text')
  add_scaffold('post', 'title:string content:text published:boolean author:references')
  add_scaffold('product', 'name', 'quantity:integer', 'price:decimal')

  directory "app/models"

  db_migrate
  db_seed
end
