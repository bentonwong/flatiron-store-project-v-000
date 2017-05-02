module ApplicationHelper

  def current_cart
    Cart.find_by(id: current_user.current_cart_id)
  end

  def create_new_current_cart
    cart = Cart.new(user_id: current_user.id)
    associate_new_cart_with_current_user(cart.id) if cart.save
  end

  def associate_new_cart_with_current_user(id)
    current_user.update(current_cart_id: id)
  end

  def reduce_inventory(cart_id)
    LineItem.where("cart_id = ?", cart_id).each do |line_item|
      item = Item.find_by(id: line_item.item_id)
      item.update(inventory: item.inventory -= line_item.quantity)
    end
  end

  def update_cart_status
    current_cart.update(status: "submitted")
  end

  def nil_current_cart
    current_user.update(current_cart_id: nil)
  end

end
