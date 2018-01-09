class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart


  def total_price
    price_in_dollars = product.price_in_cents.to_f / 100
    price = price_in_dollars * quantity
    # return price_in_dollars
    sprintf("%.2f", price)
  end

end
