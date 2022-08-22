class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :category

  # tutorial: https://youtu.be/WgNK-oINFww?t=209
  def excerpt
    ActionView::Base.full_sanitizer.sanitize(content).truncate(100)
  end
end
