class CartsController < ApplicationController
	def create
		@cart = Cart.new
		@cart.product_id = session[:product_id]
		@cart.user_id = current_user.id
		@cart.save
	end

	def index
		@carts = Cart.all
	end

	def show
		@cart = Cart.where(user_id: current_user.id)
	end

	def destroy
	end

end
