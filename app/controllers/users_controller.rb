class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :show, :update]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully signed up!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Successfully updated user!"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:danger] = "User and his articles are deleted"
      redirect_to users_path
    else
      flash[:danger] = "Sry, your requested action couldn't be performed!"
      redirect_to users_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:danger] = "You aren't authorized to perform this action"
      redirect_to home_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "You aren't admin user"
      redirect_to home_path
    end
  end

end