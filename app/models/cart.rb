class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    LineItem.where("cart_id = ?", id).collect{|li| li.quantity * Item.find_by(id: li.item_id).price}.sum
  end

  def add_item(item_id)
    line_item = LineItem.find_by(item_id: item_id, cart_id: self.id)
    if line_item
      line_item.tap {|obj| obj.quantity += 1}
    else
      LineItem.new(item_id: item_id, cart_id: self.id)
    end
  end

end
