class Post < ApplicationRecord
  extend FriendlyId

  # friendly_id :title, use: :slugged

  friendly_id :title_fallbacks, use: :slugged

  private

  def title_fallbacks
    [
      :title,
      [:title, :category]
    ]
  end
end
