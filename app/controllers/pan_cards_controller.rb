class PanCardsController < ApplicationController
  
  
  def index
    @pan_cards = PanCard.all.page(params[:page])
  end

  def show
    @pan_card = PanCard.find(params[:id])
    @userable = @pan_card
    @users = @userable.users
    @user = User.new
  end
  
  def new
    @pan_card = PanCard.new
  end

  
  
  def create
    
    @pan_card = PanCard.new(pan_card_params)
  
      if @pan_card.save
        redirect_to pan_cards_path
        flash[:message] = "New Pan card successfully created."
      else
        render :new, status: :unprocessable_entity
        flash[:message] = "Try to create again."
      end
  end
  
  def edit
    @pan_card = PanCard.find(params[:id])
  end
  
  def update
    @pan_card = PanCard.find(params[:id])
  
      if @pan_card.update(pan_card_params)
        redirect_to pan_cards_path
        flash[:message] = "Pan card successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
  
  def destroy
    @pan_card = PanCard.find(params[:id])
    @pan_card.destroy
  
    redirect_to pan_cards_path, status: :see_other
    flash[:message] = "Pan card deleted successfully."
  end
  
  private

    def pan_card_params
      params.require(:pan_card).permit(:name, :pan_no, :gender, :profile_image)
    end

end
