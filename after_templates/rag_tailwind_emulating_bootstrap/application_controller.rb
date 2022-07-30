class ApplicationController < ActionController::Base
  def css_framework
    @css_framework ||= 'bootstrap'
    "application_#{@css_framework}"
  end
  helper_method :css_framework

  def css_framework_bootstrap
    @css_framework = 'bootstrap'
  end

  def css_framework_tailwind
    @css_framework = 'tailwind'
  end
end
