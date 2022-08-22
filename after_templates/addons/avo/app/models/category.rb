class Category < ApplicationRecord
  has_many :posts

  def excerpt
    ActionView::Base.full_sanitizer.sanitize(description).truncate(100)
  end
end
