module ApplicationHelper

  def get_status(product)
    if status == true
      return Product is available
    else
      return Out of stock
    end

  end 

end
