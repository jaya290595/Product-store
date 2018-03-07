class Product < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :category
	has_many :reviews , dependent: :destroy		
	has_many :carts, dependent: :destroy
	has_many :notifies
end
