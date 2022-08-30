class DbSchema < ApplicationRecord
  belongs_to :rails_app

  # def user_name
  #   rails_app.user.name
  # end

  def display_name
    "DB Schema for #{rails_app.name} - #{created_at.strftime("%d/%m/%Y")}"
  end
end
