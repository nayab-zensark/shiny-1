class Applicant < ApplicationRecord
    has_many :job_applications, dependent: :destroy
    has_many :recruiters, through: :job_applications

    validates :name, presence: true
    validates_uniqueness_of :email_id, presence: true
    validates_uniqueness_of :phone_no, presence: true 
    validates :education_details,presence: true
end
