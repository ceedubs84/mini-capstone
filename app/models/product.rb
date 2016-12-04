class Product < ApplicationRecord
  belongs_to :supplier # hey Rails, please write me a method called supplier
  has_many :images # hey Rails, please write me a method called images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 50 }
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, uniqueness: true

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end

  def discounted?
    price.to_f < 10
  end

end