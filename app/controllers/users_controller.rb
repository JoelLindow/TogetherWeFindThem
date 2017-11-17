class UsersController < ApplicationController
  def show
    if !current_user.nil?
      user = current_user
    else
      not_found
    end
  end
end