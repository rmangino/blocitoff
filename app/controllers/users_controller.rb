class UsersController < ApplicationController

  def show
    if user_signed_in?
      @user = current_user
    else
      redirect_to hello_path
    end
  end

end
