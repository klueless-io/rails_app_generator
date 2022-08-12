# frozen_string_literal: true

# Rails 7 with Bootstrap CSS and custom CSS
# https://www.youtube.com/watch?v=tYr8yn7yRKw

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

# css_install('tailwind')

# add_controller('page', 'home', 'blog', 'readme', 'about', 'contact', 'faq', 'terms', 'privacy')
# route("root 'page#home'")

# force_copy

# copy_file   'application_controller.rb'       , 'app/controllers/application_controller.rb'

# copy_file   'page/page_controller.rb'         , 'app/controllers/page_controller.rb'
# copy_file   'page/_footer.html.erb'           , 'app/views/page/_footer.html.erb'
# template    'page/home.html.erb'              , 'app/views/page/home.html.erb'
# template    'page/faq.html.erb'               , 'app/views/page/faq.html.erb'
# copy_file   'page/blog.html.erb'              , 'app/views/page/blog.html.erb'
# copy_file   'page/readme.html.erb'            , 'app/views/page/readme.html.erb'

# # DON'T THINK _HEAD is needed anymore, check it out
# copy_file   'layouts/_head.html.erb'          , 'app/views/layouts/_head.html.erb'
# template    'layouts/_navbar.html.erb'        , 'app/views/layouts/_navbar.html.erb'
# copy_file   'layouts/_footer.html.erb'        , 'app/views/layouts/_footer.html.erb'
# template    'layouts/application.html.erb'    , 'app/views/layouts/application.html.erb'

after_bundle do
  # if needed
end
