# frozen_string_literal: true

# How to Start a Ruby on Rails 7 App With Hotwire and Tailwind CSS
# https://www.youtube.com/watch?v=7G0oWn2Gn5c

require 'pry'

self.local_template_path = File.join(File.dirname(__FILE__), 'rag_tailwind_hotwire_form')

gac 'base rails 7 image created'

route("resources :contacts")
route("root 'contacts#index'")

after_bundle do
  gsub_file 'app/views/layouts/application.html.erb', %(container mx-auto mt-28 px-5 flex), 'container mt-8 mx-auto'

  # add_scaffold('contact', 'name', 'email')
  add_migration('create_contacts', 'name', 'email', 'age:integer')
  # rails generate migration CreateUsers name:string salary:decimal

  copy_file 'contact.rb'                  , 'app/models/contact.rb'
  copy_file 'contacts_controller.rb'      , 'app/controllers/contacts_controller.rb'

  copy_file '_contact.html.erb'           , 'app/views/contacts/_contact.html.erb'
  copy_file '_count.html.erb'             , 'app/views/contacts/_count.html.erb'
  copy_file '_form.html.erb'              , 'app/views/contacts/_form.html.erb'
  copy_file '_list.html.erb'              , 'app/views/contacts/_list.html.erb'
  copy_file 'edit.html.erb'               , 'app/views/contacts/edit.html.erb'
  copy_file 'index.html.erb'              , 'app/views/contacts/index.html.erb'
  copy_file 'new.html.erb'                , 'app/views/contacts/new.html.erb'
  copy_file 'show.html.erb'               , 'app/views/contacts/show.html.erb'

  copy_file 'application_helper.rb'       , 'app/helpers/application_helper.rb'                 , force: true
  copy_file 'application.html.erb'        , 'app/views/layouts/application.html.erb'            , force: true
  copy_file 'create.turbo_stream.erb'     , 'app/views/contacts/create.turbo_stream.erb'
  copy_file 'update.turbo_stream.erb'     , 'app/views/contacts/update.turbo_stream.erb'
  copy_file 'application.js'              , 'app/javascript/application.js'                     , force: true

  copy_file '_flash.html.erb'             , 'app/views/shared/_flash.html.erb'

  # Install tailwind directly, instead of via the --css=tailwind option so that we can configure 3rd party plugins
  # gem "jsbundling-rails"
  gem "cssbundling-rails"

  rails_command('css:install:tailwind')
  run('npm install daisyui')
  # run('@tailwindcss/typography') , require(\"@tailwindcss/typography\")

  gsub_file 'tailwind.config.js', %(]\n}), "],\n  plugins: [require(\"daisyui\")],\n}"
  copy_file 'application.tailwind.css'    , 'app/assets/stylesheets/application.tailwind.css'   , force: true

  rails_command('db:migrate')
end
