# frozen_string_literal: true

# Having issues with devise/turbo.
# See: https://gorails.com/episodes/devise-hotwire-turbo
class TurboFailureApp < Devise::FailureApp
  def respond
    if request_format == :turbo_stream
      redirect
    else
      super
    end
  end

  def skip_format?
    %w(html turbo_stream */*).include? request_format.to_s
  end
end

Devise.setup do |config|
  # ==> Controller configuration
  # Configure the parent class to the devise controllers.
  config.parent_controller = 'TurboDeviseController'

  config.navigational_formats = ['*/*', :html, :turbo_stream]

  # ==> Warden configuration
  config.warden do |manager|
    manager.failure_app = TurboFailureApp
  end
end
