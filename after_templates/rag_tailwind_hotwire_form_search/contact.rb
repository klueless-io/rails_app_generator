class Contact < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true, inclusion: { in: 20...100, message: "must be between 20 and 100" }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  class << self
    def search(params)
      return all if params[:query].blank?

      where("name LIKE ?", "%#{sanitize_sql_like(params[:query])}%")
    end
  end
end
