class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    reduce_inventory(params[:id])
    update_cart_status
    nil_current_cart
    redirect_to cart_path(current_user.carts.last)
  end

end
