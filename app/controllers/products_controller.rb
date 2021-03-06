class ProductsController < ApplicationController
    include NotifiesHelper
    before_action :find_product, only:[:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        if params[:category].blank?
         @product = Product.all.order("created_at DESC")

        else
         category_id = Category.find_by(name: params[:category]).id
         @product=Product.where(category_id: category_id).order("created_at DESC")
        end
    end

    def new
        @product = Product.new
        @categories = Category.all.map { |c| [c.name, c.id] }
    end

    def create
        @product = Product.create(product_params)
        @product.category_id = params[:category_id] 
        if @product.save
            redirect_to root_path
        else
        render 'new' 
        end
    end

    def show
      session[:product_id] = @product.id 
        if @product.reviews.blank?
            @average_review = 0
        else
            @average_review =   @product.reviews.average(:rating).round(2)
        end
    end

    def edit
        @categories = Category.all.map { |c| [c.name, c.id] }
          
    end


    def update
      if @product.update(product_params)
        if @product.status == true && @product.notifies
          users = []
          users = Notify.where(product_id: @product.id)
          prod_id = @product.id
          notify_mailer(users,prod_id)
        end
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
        params.require(:product).permit(:name, :price, :status, :image, :category_id)
    end

    def find_product
        @product = Product.find(params[:id])
    end


end
