# frozen_string_literal: true

# Rails 7 with Bootstrap CSS and custom CSS
# resources:
#   https://www.youtube.com/watch?v=tYr8yn7yRKw
#   https://youtu.be/phOUsR0dm5s?t=493
#   https://www.youtube.com/watch?v=nxKDTtuKOo4

require 'pry'

self.local_template_path = File.join(File.dirname(__FILE__), 'rag_tailwind')

gac 'base rails 7 image created'

add_controller('home', 'index', 'about')
route("root 'home#index'")

index_content = join_templates(
  'component-nav.html',
  'component-hero.html',
  'component-cta.html',
  'component-faq.html',
  'component-cta.html',
  'component-footer.html'
)

create_file 'app/views/home/index.html.erb', index_content, force: true

# move the nav bar into
# 'app/views/shared/_navbar.html.erb'
# and add the nav bar to the layout
# 'app/views/layouts/application.html.erb'
# <%= render partial: 'shared/navbar' %>

# gem               'sassc-rails'

after_bundle do
  gsub_file 'app/views/layouts/application.html.erb', %(container mx-auto mt-28 px-5 flex), 'container mx-auto px-5'
  # add_css_customizations

  # add_crud_people

  # rails_command("db:migrate")
end

def add_css_customizations
  # Update the manifest to include the stylesheets
  # IS THIS CONFIGURED?
  append_to_file    'app/assets/config/manifest.js'                       , read_template('manifest.js')

  # This is how you would add custom styling via @import in the application.bootstrap.css
  append_to_file    'app/assets/stylesheets/application.bootstrap.scss'   , "@import 'custom-bootstrap-import.scss';"
  create_file       'app/assets/stylesheets/custom-bootstrap-import.scss' , read_template('custom-bootstrap-import.scss')

  # This is how you would add custom styling using standard CSS
  create_file       'app/assets/stylesheets/custom-using-css.css'         , read_template('custom-using-css.css')

  # This is how you would add custom styling using standard SAAS/SCSS
  create_file       'app/assets/stylesheets/custom-using-scss.scss'       , read_template('custom-using-scss.scss')

  # This is custom CSS for the fancier components
  create_file       'app/assets/stylesheets/custom-component.css'         , join_templates('component-cards-fancy.css', 'component-cards-staff.css')

  # Update the layout so that the stylesheets are included
  insert_into_file  'app/views/layouts/application.html.erb', read_template('application.html.erb'),
                    before: %(    <%= javascript_include_tag "application", "data-turbo-track": "reload", defer: true %>)
  gsub_file         'app/views/layouts/application.html.erb', %(    <%= yield %>), read_template('application-yield.html.erb')
end

def add_crud_people
  # Need to get the bootstrap form styling working
  # Follow the instructions at: https://youtu.be/phOUsR0dm5s?t=493
  add_scaffold('people', 'first_name', 'last_name', 'age:integer', 'address:text')
end
