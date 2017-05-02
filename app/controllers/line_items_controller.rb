class LineItemsController < ApplicationController

  def create
    create_new_current_cart if !current_cart
    current_cart.add_item(params[:item_id]).save
    redirect_to cart_path(current_cart)
  end

end
