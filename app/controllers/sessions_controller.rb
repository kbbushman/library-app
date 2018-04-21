class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to user_path(current_user)
    end
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)

    # confirm that email/password combination is correct
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:success] = "Successfully logged in." 
      redirect_to @user
    else
      flash[:error] = "Incorrect email or password."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = "Successfully logged out."
    redirect_to root_path
  end

end
