class UsersController < ApplicationController
  before_action :already_login, only: [:new]
  before_action :require_user, only: :show
  
  
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
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
  
end
