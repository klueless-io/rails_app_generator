# frozen_string_literal: true

# bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords.
#
# exe/rag addons/bcrypt_ruby

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
end

def setup_db
  add_scaffold('user', 'name', 'password', 'password_hash')
  directory "app/models"
  directory "app/views/users"

  db_migrate
  db_seed
end
