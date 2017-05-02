class OrdersController < ApplicationController

  def show
    if current_user.id == Cart.find_by(id: params[:id]).user_id
      @order = Cart.find_by(id: params[:id])
    else
      redirect_to store_path
    end
  end

end
