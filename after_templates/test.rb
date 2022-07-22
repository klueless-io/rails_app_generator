# frozen_string_literal: true

require 'pry'

# after_bundle do
#   setup_rails.after_bundle
# end

add_scaffold('post', 'title', 'content:text')
add_scaffold('book', 'title', 'content:text')
# add_resource("comment", "post:references", 'content:text')
# add_mailer("posts", "submitted", "broken")
