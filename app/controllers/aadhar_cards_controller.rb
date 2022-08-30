class AadharCardsController < ApplicationController
  

  def index
    @aadhar_cards = AadharCard.all
  end

  def show
    @aadhar_card = AadharCard.find(params[:id])
    
  end
  
  def new
    @aadhar_card = AadharCard.new
  end
  
  def create
    binding.pry
    @aadhar_card = AadharCard.new(aadhar_card_params)
  
      if @aadhar_card.save
        redirect_to aadhar_cards_path
        flash[:message] = "New aadhar card successfully created."
      else
        render :new, status: :unprocessable_entity
        flash[:message] = "Try to create again."
      end
  end
  
  def edit
    @aadhar_card = AadharCard.find(params[:id])
  end
  
  def update
    @aadhar_card = AadharCard.find(params[:id])
  
      if @aadhar_card.update(aadhar_card_params)
        redirect_to aadhar_cards_path
        flash[:message] = "Aadhar card successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
  
  def destroy
    @aadhar_card = AadharCard.find(params[:id])
    @aadhar_card.destroy
  
    redirect_to aadhar_cards_path, status: :see_other
    flash[:message] = "Aadhar card deleted successfully."
  end
  
  private
    def aadhar_card_params
      params.require(:aadhar_card).permit(:name, :aadhar_no, :dob, :address)
    end

end
