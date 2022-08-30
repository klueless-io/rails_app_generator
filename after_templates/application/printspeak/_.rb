# frozen_string_literal: true

# Description goes here
#
# exe/rag addons/printspeak

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

after_bundle do
  force_copy
  prepare_postgresql
  scaffolds
  setup_controllers
  setup_customizations
  setup_db
  setup_avo
end

def scaffolds
  add_scaffold('post', 'title', 'body:text')
  add_scaffold('people', 'first_name', 'last_name', 'age:integer', 'address:text')
end

def setup_controllers
  route("root 'home#index'")

  add_controller('home', 'index')
  add_controller('page', 'benefits', 'faq', 'terms', 'privacy', '--skip-routes')

  route("root 'home#index'")
  route(<<-'RUBY')
  PageController.action_methods.each do |action|
    get "/#{action}", to: "page##{action}", as: "page_#{action}"
  end
  RUBY
end

def setup_customizations
  directory "app/assets/images"
  directory "app/assets/stylesheets"
  directory "app/controllers"
  directory "app/models"
  directory "app/views"
  # directory "app/services"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
end

def setup_db
  template  'db/seeds.rb'                                   , 'db/seeds.rb'

  gsub_file('config/database.yml', '  encoding: unicode', db_development_settings)

  db(drop: true, create: true, migrate: true, seed: true)
end

def setup_avo
  # generate('avo:install')

  # generate('avo:resource Category')
  # generate('avo:resource Post')
  # generate('avo:resource Comment')
  # generate('avo:resource Location')
  # generate('avo:resource Room')
  # generate('avo:resource Booking')
  # generate('avo:resource User')
  # generate('avo:dashboard Dashboard')

  # directory "app/avo"
  # directory "config/initializers"
  # directory "config/locales"

  # add devise support
  # gsub_file 'config/initializers/avo.rb', %(# config.current_user_method = {}), 'config.current_user_method = :current_user'
end

def prepare_postgresql
  gsub_file('config/database.yml', '  encoding: unicode', db_development_settings)
end

def db_development_settings
  <<-'RUBY'
  encoding: unicode
  host: <%= ENV['DATABASE_HOST'] %>
  username: <%= ENV['DATABASE_USERNAME'] %>
  password: <%= ENV['DATABASE_PASSWORD'] %>
  RUBY
end
