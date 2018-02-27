class Product < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :reviews
	has_many :users
	belongs_to :cart
end
