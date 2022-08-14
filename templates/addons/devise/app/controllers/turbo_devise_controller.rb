class TurboDeviseController < ApplicationController
  class Responder < ActionController::Responder
    def to_turbo_stream
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => e
      if get?
        raise e
      elsif has_errors? && default_action
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      else
        redirect_to navigation_location
      end
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream
end


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
  ...
  # Configure the parent class to the custom controller.
  config.parent_controller = 'TurboDeviseUserController'
  config.navigational_formats = ['*/*', :html, :turbo_stream]


  # Warden configuration
  config.warden do |manager|
    manager.failure_app = TurboFailureApp
  end

...
end