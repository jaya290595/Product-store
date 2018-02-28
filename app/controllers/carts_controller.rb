class CartsController < ApplicationController
	before_action :cart_params, only: [:show, :edit, :update, :destroy]
	def create
		@cart = Cart.new
		@cart.product_id = session[:product_id]
		@cart.user_id = current_user.id
		@cart.save
		redirect_to carts_path
	end

	def index
		@carts = Cart.where(user_id: current_user.id)
	end

	def show
	end

	def destroy
		@cart.destroy
		redirect_to carts_path
	end

	private

	def cart_params
		@cart = Cart.find(params[:id])
	end

end
