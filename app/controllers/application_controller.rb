class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def not_found
    render file: "/public/404"
  end
end
