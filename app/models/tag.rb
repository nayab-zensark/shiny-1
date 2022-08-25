class Tag < ApplicationRecord
    has_many :product_tags, dependent: :destroy
    has_many :products, through: :product_tags

    validates :tag_name, :tag_description, :tag_code, presence: true

end
