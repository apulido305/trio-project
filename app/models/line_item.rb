class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

#   def total_price
#     # returns the total price for the individual line item and entire cart,respectively
#     product.price * quantity
#   end
end
