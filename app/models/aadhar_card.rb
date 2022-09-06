class AadharCard < ApplicationRecord
    paginates_per 2
    has_one_attached :profile_image

    has_many :users, :as => :userable

    validates :name, :aadhar_no, :dob, :address, presence: true
end
