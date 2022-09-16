class PostsController < ApplicationController
  def index
    @posts = Post.all
    
  end

  def show
   
    @post = Post.find(params[:id])
    
  end
  
  def new
    @post = Post.new
    
   end
  
  def create
    Post.create(post_params)
    redirect_to root_path
    
  end
  
  def edit
    @post = Post.find(params[:id])
   
    
  end
  
  def update
    @post = Post.find(params[:id])
  
      if @post.update(post_params)
        redirect_to posts_path
        flash[:message] = "Post successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  
    redirect_to users_path, status: :see_other
    flash[:message] = "Post deleted successfully."
  end
  
  private
  def post_params
    params.require(:post).permit(:description, :image, :user_id)
  end
  
end
