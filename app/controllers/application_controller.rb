class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_path
  end

  def not_found
    raise ActionController::RoutingError.new('Course not found')
  end

  def blog_not_found
    raise ActionController::RoutingError.new('Blog not found')
  end
end
