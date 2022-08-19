class JobApplication < ApplicationRecord
  belongs_to :recruiter
  belongs_to :applicant

  validates :job_name, presence: true
  validates :job_description, presence: true
  validates :qualification, presence: true
  validates :last_date, presence: true
  
end
