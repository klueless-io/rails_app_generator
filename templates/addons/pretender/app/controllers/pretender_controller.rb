class PretenderController < ApplicationController
  before_action :authenticate_user!

  def impersonate
    user = User.find(params[:user_id])
    impersonate_user(user)
    redirect_to root_path
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to root_path
  end
end
