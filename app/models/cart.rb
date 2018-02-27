class Cart < ApplicationRecord
	belongs_to :user
	has_many :products

	def total_price
	   products.to_a.sum(&:full_price)
	 end
end

