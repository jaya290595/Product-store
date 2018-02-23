class ProductsController < ApplicationController
	before_action :find_product, only:[:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	def index
		if params[:category].blank?
		 @book = Product.all.order("created_at DESC")

		else
		 category_id = Category.find_by(name: params[:category]).id
		 @book=Product.where(category_id: category_id).order("created_at DESC")
		end
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.create(product_params)		
		if @product.save
			redirect_to root_path
		else
		render 'new' 
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
	end

	def update
		if @product.update(product_params)
			redirect_to root_path (@product)
		else
			render 'edit'
		end
	end

	def destroy
		@product.destroy
		redirect_to root_path
	end

	private

	def product_params
		params.require(:product).permit(:name, :price, :status, :image)
	end

	def find_product
		@product = Product.find(params[:id])
	end


end
