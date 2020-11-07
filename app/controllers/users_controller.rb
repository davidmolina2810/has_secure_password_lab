class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    if user_params[:password] == user_params[:password_confirmation]
      session[:user_id] = @user.id
      redirect_to users_home_path
    else 
      redirect_to users_new_path
    end
  end

  def home
    @user = User.find_by(id: current_user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
