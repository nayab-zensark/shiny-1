class Recruiter < ApplicationRecord
    has_many :job_applications, dependent: :destroy
    has_many :applicants, through: :job_applications

    validates :company_name, presence: true
    validates :company_id, presence: true
    validates_uniqueness_of :email_id, presence: true
    validates_uniqueness_of :phone_no, presence: true

end
