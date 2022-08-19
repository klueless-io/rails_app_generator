class HomeController < ApplicationController
  before_action :require_permission, except: %i[index quick_sign_in]

  def index
  end

  def quick_sign_in
    user = User.find(params[:user_id])
    sign_in(user)
    redirect_to root_path
  end

  def bossy_boots
  end

  def use_in_moderation
  end

  def use_me
  end

  def super_hero
  end

  def require_permission
    return if current_user&.is_super_user?
    return if current_user&.is_admin?           && action_name == "bossy_boots"
    return if current_user&.is_moderator?       && action_name == "use_in_moderation"
    return if current_user&.is_user?            && action_name == "use_me"

    flash.alert = "You do not have permission to access #{action_name.titleize}"

    redirect_to root_path
  end
end
