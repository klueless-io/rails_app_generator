# frozen_string_literal: true

# Rails 7 - Intro to Devise
# https://www.youtube.com/watch?v=m3uhldUGVes

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

add_controller('home', 'index')
add_scaffold('post', 'title', 'body:text')
# route("root 'posts#index'")
# generate('devise:views')

force_copy

directory "app/controllers"
directory "app/views"

# copy_file   'application_controller.rb'           , 'app/controllers/application_controller.rb'

# copy_file   'layouts/_alerts.html.erb'            , 'app/views/layouts/_alerts.html.erb'
# copy_file   'layouts/_navbar.html.erb'            , 'app/views/layouts/_navbar.html.erb'
# copy_file   'layouts/_footer.html.erb'            , 'app/views/layouts/_footer.html.erb'
# template    'layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'

copy_file   'user.rb'                             , 'app/models/user.rb'

# copy_file   'application.html.erb'                , 'app/views/layouts/application.html.erb'
# copy_file   'application_controller.rb'           , 'app/controllers/application_controller.rb'

after_bundle do
  add_migration('add_user_to_posts', 'user:belongs_to')
  db_migrate

  append_to_file('db/seeds.rb', read_template('seed_data.rb'))
  db_seed
end
