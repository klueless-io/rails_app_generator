class ApplicationController < ActionController::Base
  impersonates :user
end
