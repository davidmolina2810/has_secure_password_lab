class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: session_params[:name])
    return head(:forbidden) unless @user.authenticate(session_params[:password])
    current_user
    redirect_to users_home_path
  end

  def destroy
    session.delete :user_id
    flash[:logged_out] = ["You've been logged out."]
    redirect_to login_path
  end

  private
  def session_params
    if params.include?(:user) 
      model = :user 
    else 
      model = :sessions
    end
    params.require(model).permit(:name, :password)
  end
end
