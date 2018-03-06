class CartsController < ApplicationController
    before_action :find_cart, only: [:show, :edit, :update, :destroy]
    
    def create
        @cart = Cart.new(cart_params)
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
      params.require(:cart).permit!
    end 

    def find_cart
        @cart = Cart.find(params[:id])
    end

end
