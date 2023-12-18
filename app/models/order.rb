class Order < ApplicationRecord
  belongs_to :customer
  validates :product_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :product_name , presence: true
  validates :customer_id, presence: true
  validates_associated :customer
end
