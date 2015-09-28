class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update]
  before_action :require_logout, only: [:new]
  before_action :correct_user,   only: [:edit, :update]
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end
  
  def show
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to profile_path
    else
      render edit_user_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
  
end
