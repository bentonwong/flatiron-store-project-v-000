module ApplicationHelper

  def current_cart
    Cart.find_by(id: current_user.current_cart_id)
  end

end
