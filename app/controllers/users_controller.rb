class UsersController < ApplicationController
  before_action :load_userable

  def index
    @users = @userable.users
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = @userable.users.new
  end
  

  def create
    @user = @userable.users.new(user_params)
      if @user.save!
        redirect_to [@userable, :users]
        flash[:message] = "New user successfully created."
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
        flash[:message] = "user successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  
    redirect_to users_path, status: :see_other
    flash[:message] = "user deleted successfully."
  end
  
  private

  def load_userable
    resource, id = request.path.split('/')[1,2]
    @userable = resource.singularize.classify.constantize.find(id)
  end
    
  def user_params
    params.require(:user).permit(:name, :email, :password, :userable_type, :userable_id)
  end

end
