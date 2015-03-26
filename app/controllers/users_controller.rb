class UsersController < ApplicationController
  def index
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    if @users.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to @user
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end

private
  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :salt)
    end
end
