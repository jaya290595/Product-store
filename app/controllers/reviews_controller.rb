class ReviewsController < ApplicationController
	before_action :find_product
	before_action :find_review, only: [:edit, :update, :destroy]

	def new
		@review = Review.new
	end

	def create
	@product= Product.find(params[:product_id])
    @review= @product.reviews.create(review_params)
    @review.user_id = current_user.id
      if @review.save
        redirect_to product_path(@product)
      else
        render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to product_path(@product)
		else
			render 'edit'
		end
	end

	def show
		
	end

	def destroy
		  @review.destroy
		  redirect_to product_path(@product)
	end

	private
	def review_params
		params.require(:review).permit(:rating, :comment)
	end 

	def find_product
		@product = Product.find(params[:product_id])
	end

	def find_review
		@review = Review.find(params[:id])
	end

end
