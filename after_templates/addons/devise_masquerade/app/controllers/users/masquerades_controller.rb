class Users::MasqueradesController < Devise::MasqueradesController
  # This location matches the location for other Devise controllers

  protected

  # Custom url redirect after masquerade
  def after_masquerade_path_for(_resource)
    root_path
  end
end
