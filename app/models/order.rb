class Order < ApplicationRecord
  has_many :orderdetails, dependent: :destroy

  validates :po_number, presence: true

  accepts_nested_attributes_for :orderdetails

  def total_quantity
    total_quantity = 0
    if self.orderdetails.present?
      self.orderdetails.each do |orderdetail|
        total_quantity = total_quantity + orderdetail.quantity
      end
    end
    total_quantity
  end

  def total_amount
    total_amount = 0
    if self.orderdetails.present?
      self.orderdetails.each do |orderdetail|
        sub_total = 0
        sub_total = (orderdetail.price * orderdetail.quantity)
        total_amount = total_amount + sub_total
      end
    end
    total_amount
  end

end
