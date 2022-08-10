# frozen_string_literal: true

# Description goes here
#
# exe/rag addons/printspeak

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
add_controller('page', 'benefits', 'faq', 'terms', 'privacy', '--skip-routes')

route("root 'home#index'")
route(<<-'RUBY')
PageController.action_methods.each do |action|
  get "/#{action}", to: "page##{action}", as: "page_#{action}"
end
RUBY

after_bundle do
  customizations 
  setup_db
  rubocop
end

def customizations
  force_copy

  directory "app/assets/images"
  directory "app/assets/stylesheets"

  directory "app/controllers"

  directory "app/views/home"
  directory "app/views/page"

  directory "app/views/layouts"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'

  template  'db/seeds.rb'                                   , 'db/seeds.rb'
end

def setup_db
  add_scaffold('post', 'title', 'body:text')
  add_scaffold('people', 'first_name', 'last_name', 'age:integer', 'address:text')

  db_migrate
end
