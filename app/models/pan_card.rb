class PanCard < ApplicationRecord
    has_many :users, :as => :userable

    validates :name, :pan_no, :gender, presence: true
end
