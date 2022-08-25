class ProductsController < ApplicationController
  def index
    @products = Product.all
    
  end

  def show
    @product = Product.find(params[:id])
    @t = Product.find(params[:id]).tags
    
  end
  
  def new
    @product = Product.new
    @all_tags = Tag.all
   end
  
  def create
    
    @product = Product.new(product_params)

      if @product.save!
        redirect_to products_path
        flash[:message] = "New Product successfully created."
      else
        
        render :new, status: :unprocessable_entity
        flash[:message] = "Try to create again."
      end
  end
  
  def edit
    @product = Product.find(params[:id])
    @all_tags = Tag.all
    
  end
  
  def update
    @product = Product.find(params[:id])
  
      if @product.update(product_params)
        redirect_to products_path
        flash[:message] = "Product successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  
    redirect_to products_path, status: :see_other
    flash[:message] = "Product deleted successfully."
  end
  
  private
    def product_params
      params.require(:product).permit(:product_name, :product_details, :cost, tag_ids: [])
    end
end
