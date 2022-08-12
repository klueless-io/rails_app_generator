class Author < ApplicationRecord
  has_many :posts

  validates :name, presence: true
  validates :bio, length: { maximum: 100 }
end
