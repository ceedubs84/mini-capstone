class Product < ApplicationRecord
  def dollar_price
    dollar_price = "$" + price
  end
end