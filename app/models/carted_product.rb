class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0, only_integer: true }
  validates :status,  
  
  def subtotal
    quantity * product.price
  end

end
