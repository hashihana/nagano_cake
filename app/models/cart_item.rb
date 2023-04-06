class CartItem < ApplicationRecord
  
    belongs_to :item, optional: true
    belongs_to :customer, optional: true

    validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  
  def subtotal
    item.with_tax_price * amount
  end

end
