class SessionsController < ApplicationController
  def create
    binding.pry
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:id] = user.id
    redirect_to root_path
  end
end
