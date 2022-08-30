class AadharCard < ApplicationRecord
    has_many :users, :as => :userable

    validates :name, :aadhar_no, :dob, :address, presence: true
end
