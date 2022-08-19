class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.all
  end

  def show
    @applicant = Applicant.find(params[:id])
    @jap = Applicant.find(params[:id]).job_applications
  end
  
  def new
    @applicant = Applicant.new
  end
  
  def create
    @applicant = Applicant.new(applicant_params)
  
      if @applicant.save
        redirect_to @applicant
      else
        render :new, status: :unprocessable_entity
      end
  end
  
  def edit
    @applicant = Applicant.find(params[:id])
  end
  
  def update
    @applicant = Applicant.find(params[:id])
  
      if @applicant.update(applicant_params)
        redirect_to @applicant
      else
        render :edit, status: :unprocessable_entity
      end
  end
  
  def destroy
    @applicant = Applicant.find(params[:id])
    @applicant.destroy
  
    redirect_to root_path, status: :see_other
  end
  
  private
    def applicant_params
      params.require(:applicant).permit(:name, :email_id, :phone_no, :education_details)
    end
end
