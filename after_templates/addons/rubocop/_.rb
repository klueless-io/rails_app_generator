# frozen_string_literal: true

# RuboCop is a Ruby code style checking and code formatting tool.
#
# exe/rag addons/rubocop

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
route("root 'home#index'")

after_bundle do
  # This will clean up the standard Rails application
  run('rubocop -A --config .rubocop.yml')

  # There are linting errors in the controller that can be fixed manually with
  # rubocop -A --config .rubocop.yml

  force_copy

  copy_file 'app/controllers/home_controller.rb'            , 'app/controllers/home_controller.rb'
  copy_file 'app/views/home/index.html.erb'                 , 'app/views/home/index.html.erb'
  copy_file 'app/assets/images/cop-output.png'              , 'app/assets/images/cop-output.png'

  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
end

