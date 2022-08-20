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
  setup_avo
end

def setup_db
  add_scaffold('author', 'name:string', 'email:string', 'bio:text')
  add_scaffold('category', 'title:string', 'description:text')
  add_scaffold('post', 'title:string content:text', 'published:boolean', 'author:references', 'category:references')
  add_scaffold('product', 'name', 'quantity:integer', 'price:decimal', 'author:references')
  add_scaffold('location', 'name', 'description:text', 'photo:file')
  add_scaffold('room', 'name', 'description:text', 'photo:file', 'location:references')
  add_scaffold('booking', 'user:references', 'room:references', 'booked_at:timestamp', 'booked_for:number')

  db_migrate
  db_seed
end

def setup_avo
  generate('avo:install')
  generate('avo:resource Product')
  generate('avo:resource Post')
  generate('avo:resource Author')
  generate('avo:resource Category')
  generate('avo:resource User')
  generate('avo:dashboard Dashboard')

  # add devise support
  gsub_file 'config/initializers/avo.rb', %(# config.current_user_method = {}), 'config.current_user_method = :current_user'
end
