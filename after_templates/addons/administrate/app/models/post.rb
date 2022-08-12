class Post < ApplicationRecord
  belongs_to :author, required:  true

  validates :title, presence: true, format: { with: /\A[a-zA-Z &0-9+!]+\z/, message: "only allows letters, numbers plus &!+" }
end
