class Orderdetail < ApplicationRecord
  belongs_to :order
  belongs_to :model
  belongs_to :size
  belongs_to :color

  validates_numericality_of :quantity, greater_than: 0, message: "must greater than zero!"
  validates_uniqueness_of :model, scope: [:size, :color], message: "has existed!"

  default_scope -> { order("model_id, size_id ASC") }

  def total_amount
    total_amount = (self.price * self.quantity)
  end
end
