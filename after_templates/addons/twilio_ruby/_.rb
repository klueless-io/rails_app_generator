# frozen_string_literal: true

# The official library for communicating with the Twilio REST API, building TwiML, and generating Twilio JWT Capability Tokens
#
# exe/rag addons/twilio_ruby

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

add_controller('home', 'index')
route("root 'home#index'")
route("get 'home/send_sms'")

# route("root 'home#index'")

force_copy

copy_file 'app/controllers/home_controller.rb', 'app/controllers/home_controller.rb'
copy_file 'app/views/home/index.html.erb', 'app/views/home/index.html.erb'
copy_file 'config/initializers/twilio.rb', 'config/initializers/twilio.rb'
