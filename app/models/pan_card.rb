class PanCard < ApplicationRecord
    paginates_per 2
    has_one_attached :profile_image

    has_many :users, :as => :userable

    validates :name, :pan_no, :gender, presence: true
end
