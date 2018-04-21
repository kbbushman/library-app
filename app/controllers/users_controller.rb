class UsersController < ApplicationController
  
  before_action :get_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show]
  before_action :require_account_owner, except: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    # Don't let current user see new user form
    if current_user
        redirect_to user_path(current_user)
    end
    @user = User.new
  end

  def create
    # don't let current_user create new account
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new(user_params)
      if @user.save
        login(@user)
        flash[:success] = 'Account created successfully'
        # redirect_to root_path
        redirect_to @user
      else
        flash[:error] = @user.errors.full_messages.join(", ")
        redirect_to new_user_path
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def get_user
    # @user = User.friendly.find(params[:id])
    @user = User.find(params[:id])
  end

  def require_account_owner
    if @current_user != @user
      flash[:error] = 'You do not have permission to view this account.'
      redirect_to root_path
    end
  end

end
