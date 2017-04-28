module ApplicationHelper

  def current_cart
    Cart.find_by(id: User.find_by(id: current_user.id).current_cart_id)
  end

end
