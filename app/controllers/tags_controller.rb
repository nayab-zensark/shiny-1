class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end
  
  def show
    @tag = Tag.find(params[:id])
    @ab = Tag.find(params[:id]).products
  end
  
  def new
    @tag = Tag.new
  end
  
  def create
    
    @tag = Tag.new(tag_params)
  
      if @tag.save
        redirect_to tags_path
        flash[:message] = "New Tag successfully created."
      else
        render :new, status: :unprocessable_entity
        flash[:message] = "Try to create again."
      end
  end
  
  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
  
      if @tag.update(tag_params)
        redirect_to tags_path
        flash[:message] = "Tag successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
  
    redirect_to tags_path, status: :see_other
    flash[:message] = "Tag deleted successfully."
  end
  
  private
    def tag_params
      params.require(:tag).permit(:tag_name, :tag_description, :tag_code)
    end
end
