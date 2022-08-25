class Product < ApplicationRecord
    has_many :product_tags, dependent: :destroy
    has_many :tags, through: :product_tags

    validates :product_name, :product_details, :cost, presence: true
end
