# frozen_string_literal: true

# HTML sanitization for Rails applications
self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

add_controller('home', 'index')
route("root 'home#index'")

force_copy

copy_file 'home/index.html.erb', 'app/views/home/index.html.erb'
