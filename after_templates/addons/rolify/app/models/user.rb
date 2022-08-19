class User < ApplicationRecord
  # Rolify needs to be called before assigning default role due to a bug in Rolify
  # see: https://github.com/RolifyCommunity/rolify/issues/518#issuecomment-1218705389
  rolify

  after_create :assign_default_role

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validate :must_have_role, on: :update

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def role_names
    roles.distinct.pluck(:name)
  end

  def must_have_role
    if self.roles.blank?
      errors.add(:roles, "User must have at least one role")
    end
  end
end
