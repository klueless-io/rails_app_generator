class User < ApplicationRecord
  after_initialize :set_default_role, if: :new_record?

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts

  enum role: { user: 0, moderator: 1, admin: 9 }

  private

  def set_default_role
    self.role ||= :user
  end
end
