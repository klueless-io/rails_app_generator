class ApplicationController < ActionController::Base
  before_action :masquerade_user!
end
