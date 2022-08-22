class RecruitersController < ApplicationController
  def index
    @recruiters = Recruiter.all
  end

  def show
    @recruiter = Recruiter.find(params[:id])
    @jap = Recruiter.find(params[:id]).job_applications
  end
  
  def new
    @recruiter = Recruiter.new
  end
  
  def create
    @recruiter = Recruiter.new(recruiter_params)
  
      if @recruiter.save
        redirect_to recruiters_path
        flash[:message] = "New Recruiter successfully created."
      else
        render :new, status: :unprocessable_entity
        flash[:message] = "Try to create again."
      end
  end
  
  def edit
    @recruiter = Recruiter.find(params[:id])
  end
  
  def update
    @recruiter = Recruiter.find(params[:id])
  
      if @recruiter.update(recruiter_params)
        redirect_to recruiters_path
        flash[:message] = "Recruiter successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
  
  def destroy
    @recruiter = Recruiter.find(params[:id])
    @recruiter.destroy
  
    redirect_to recruiters_path, status: :see_other
    flash[:message] = "Recruiter deleted successfully."
  end
  
  private
    def recruiter_params
      params.require(:recruiter).permit(:company_name, :company_id, :email_id, :phone_no)
    end
end
