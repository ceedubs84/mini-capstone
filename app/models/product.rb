class Product < ApplicationRecord
  def sale_message
    sale_message = ""
    if price.to_i < 10
      sale_message = "Discount Item!"
    else 
      sale_message = "Quotidian Worth!"
    end
  end

  def tax
    (price.to_i * 0.09).to_f
  end

  def total
    (price.to_f + tax).to_s
  end
end