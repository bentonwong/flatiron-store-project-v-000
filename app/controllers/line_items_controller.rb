class LineItemsController < ApplicationController

  def create
    if !current_cart
      cart = Cart.new(user_id: current_user.id)
      if cart.save
        user = current_user
        user.current_cart_id = cart.id
        user.save
      end
    end
    current_cart.add_item(params[:item_id]).save
    redirect_to cart_path(current_cart)
  end

  private

    def li_params
      params.permit(:item_id, :cart_id, :quantity)
    end

end
