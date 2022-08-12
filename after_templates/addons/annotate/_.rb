# frozen_string_literal: true

# Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
#
# exe/rag addons/annotate

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

after_bundle do
  add_scaffold('post', 'title', 'body:text')
  db_migrate
end
