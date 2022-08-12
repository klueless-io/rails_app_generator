# frozen_string_literal: true

# How to Start a Ruby on Rails 7 App With Hotwire and Tailwind CSS
# https://www.youtube.com/watch?v=7G0oWn2Gn5c

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
route("get 'home/increment', as: :increment")
route("root 'home#index'")

copy_file 'home/controller.rb'     , 'app/controllers/home_controller.rb' , force: true
copy_file 'home/helper.rb'         , 'app/helpers/home_helper.rb'         , force: true
copy_file 'home/index.html'        , 'app/views/home/index.html.erb'      , force: true
copy_file 'home/increment.html.erb', 'app/views/home/increment.html.erb'  , force: true

after_bundle do
  gsub_file 'app/views/layouts/application.html.erb', %(container mx-auto mt-28 px-5 flex), 'container mt-8 mx-auto'
end
