class JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.all
  end

  def show
    @job_application = JobApplication.find(params[:id])
  end
  
  def new
    @job_application = JobApplication.new
  end
  
  def create
    @job_application = JobApplication.new(job_application_params)
  
      if @job_application.save
        redirect_to job_applications_path
        flash[:message] = "New Job Application successfully created."
      else
        render :new, status: :unprocessable_entity
        flash[:message] = "Try to create again."
      end
  end
  
  def edit
    @job_application = JobApplication.find(params[:id])
  end
  
  def update
    @job_application = JobApplication.find(params[:id])
  
      if @job_application.update(job_application_params)
        redirect_to job_applications_path
        flash[:message] = "Job Application successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
  
  def destroy
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy
  
    redirect_to job_applications_path, status: :see_other
    flash[:message] = "Job Application successfully deleted."
  end
  
  private
    def job_application_params
      params.require(:job_application).permit(:recruiter_id, :applicant_id, :job_name, :job_description, :qualification, :last_date)
    end
end
