# frozen_string_literal: true

# Rails 7 with Bootstrap CSS and custom CSS
# https://www.youtube.com/watch?v=tYr8yn7yRKw

require 'pry'

self.local_template_path = File.join(File.dirname(__FILE__), 'rag_simple')

gac 'base rails 7 image created'

after_bundle do
  # if needed
end
