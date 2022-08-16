class Post < ApplicationRecord
  after_initialize :set_views, if: :new_record?

  belongs_to :user

  private

  def set_views
    self.views ||= 0
  end
end
