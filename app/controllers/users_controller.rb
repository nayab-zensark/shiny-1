class UsersController < ApplicationController
  def index
    @users = User.all
  end
    
  def show
    @user = User.find(params[:id])
  end
      
  def new
    @user = User.new
  end
      
  def create
    @user = User.new(user_params)
      if @user.save!
        redirect_to users_path
        flash[:message] = "New User successfully created."
      else
        render :new, status: :unprocessable_entity
        flash[:message] = "Try to create again."
      end
  end
      
  def edit
    @user = User.find(params[:id])
  end
      
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to users_path
        flash[:message] = "User successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
      
  def destroy
    @user = User.find(params[:id])
    @user.destroy
      
    redirect_to users_path, status: :see_other
    flash[:message] = "User deleted successfully."
  end
      
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
