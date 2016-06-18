class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def total
    self.item.price * self.quantity
  end

end
