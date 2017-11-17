class SessionsController < ApplicationController
  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:id] = user.id
    redirect_to dashboard_index_path
    flash[:notice] = "Welcome back, #{user.first_name} #{user.last_name}!"
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
