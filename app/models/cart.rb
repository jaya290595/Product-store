class Cart < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates :quantity, :presence => { :message => " cannot be blank" }

end