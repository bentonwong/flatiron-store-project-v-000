class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    LineItem.where("cart_id = ?", params[:id]).each do |line_item|
      item = Item.find_by(id: line_item.item_id)
      item.inventory  -= line_item.quantity
      item.save
    end
    user = current_user
    user.current_cart_id = nil
    user.save
    redirect_to cart_path(user.carts.last)
  end

end
