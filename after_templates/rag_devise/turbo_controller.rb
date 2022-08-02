class TurboController < ApplicationController

  # This is required for Devise to work.
  # See: https://youtu.be/m3uhldUGVes?t=1432
  #
  # Having issues with devise/turbo.
  # See: https://gorails.com/episodes/devise-hotwire-turbo
  class Responder < ActionController::Responder
    def to_turbo_stream
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => error
      if get?
        raise error
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