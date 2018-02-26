class Product < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :reviews
	belongs_to :user
end
