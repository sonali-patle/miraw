class Product < ApplicationRecord
    mount_uploader :image_url, ImageUploader
    validates :title, :description, :image_url, :price, :date_available, presence: true
    has_many :items

    def self.salable_products
        self.where("date_available <= ?", Time.now).order("date_available desc")
    end
end
