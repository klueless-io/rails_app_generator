# frozen_string_literal: true

# Rails 7 - Intro to Devise
# https://www.youtube.com/watch?v=m3uhldUGVes

require 'pry'

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

# generate('devise:views')

add_scaffold('post', 'title', 'body:text')
route("root 'posts#index'")

force_copy

copy_file   'application_controller.rb'           , 'app/controllers/application_controller.rb'
copy_file   'turbo_controller.rb'                 , 'app/controllers/turbo_controller.rb'

copy_file   'layouts/_alerts.html.erb'            , 'app/views/layouts/_alerts.html.erb'
copy_file   'layouts/_navbar.html.erb'            , 'app/views/layouts/_navbar.html.erb'
copy_file   'layouts/_footer.html.erb'            , 'app/views/layouts/_footer.html.erb'
template    'layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'

copy_file   'config/initializers/devise_turbo.rb' , 'config/initializers/devise_turbo.rb'

copy_file   'post/posts_controller.rb'            , 'app/controllers/posts_controller.rb'
copy_file   'post/_post.html.erb'                 , 'app/views/posts/_post.html.erb'
copy_file   'post/post.rb'                        , 'app/models/post.rb'

copy_file   'user.rb'                             , 'app/models/user.rb'

copy_file   'application.html.erb'                , 'app/views/layouts/application.html.erb'
copy_file   'application_controller.rb'           , 'app/controllers/application_controller.rb'

add_migration('add_user_to_posts', 'user:belongs_to')

after_bundle do
  db_migrate

  append_to_file('db/seeds.rb', read_template('seed_data.rb'))
  db_seed
end
