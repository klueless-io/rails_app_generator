# frozen_string_literal: true

# Avo abstracts away the common parts of building apps, letting your engineers work on your app's essential components. The result is a full-featured admin panel that works out of the box, ready to give to your end-users.
#
# exe/rag addons/avo
# 
# based on: https://youtu.be/WgNK-oINFww
#           https://youtu.be/BK47E7TMXn0

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

after_bundle do
  scaffolds
  setup_customizations
  setup_db
  setup_avo

  swap1 = '  resources :users'
  swap2 = "  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }"

  swap_lines('config/routes.rb', swap1, swap2)
end

def scaffolds
  add_scaffold_controller('users', 'name', 'email')
  add_scaffold('category', 'title', 'description:text')
  add_scaffold('post', 'title', 'content:text', 'published:boolean', 'user:references', 'category:references')
  add_scaffold('comment', 'body:text', 'commentable:references{polymorphic}', 'user:references')

  add_scaffold('location', 'name', 'description:text') #, 'photo:file')
  add_scaffold('room', 'name', 'description:text', 'location:references') #, 'photo:file'
  add_scaffold('booking', 'user:references', 'room:references', 'booked_at:datetime', 'booked_for:integer')
end

def setup_customizations
  route("root 'home#index'")

  force_copy
  
  add_controller('home', 'index', 'quick_signin', 'reseed')
  
  directory "app/controllers"
  directory "app/models"
  directory "app/views"
  directory "app/services"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
end

def setup_db
  template  'db/seeds.rb'                                   , 'db/seeds.rb'

  db_migrate
  db_seed
end

def setup_avo
  # generate('avo:install')

  generate('avo:resource Category')
  generate('avo:resource Post')
  generate('avo:resource Comment')
  generate('avo:resource Location')
  generate('avo:resource Room')
  generate('avo:resource Booking')
  generate('avo:resource User')
  generate('avo:dashboard Dashboard')

  directory "app/avo"
  directory "config/initializers"
  directory "config/locales"

  # add devise support
  gsub_file 'config/initializers/avo.rb', %(# config.current_user_method = {}), 'config.current_user_method = :current_user'
end
