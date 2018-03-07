class NotifiesController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @notify = @product.notifies.new
    @notify.user_id = current_user.id
    @notify.save
  end

end
