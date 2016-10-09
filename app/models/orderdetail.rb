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

  #--------- For Output to CSV: send_data method approach
  #
  def po_number
    self.order.po_number
  end

  def m_name
    self.model.name
  end

  def s_name
    self.size.name
  end

  def c_name
    self.color.name
  end

  # class method
  def self.to_csv
    header = ['PO Number','Model Name', 'Size', 'Color', 'Price (USD)', 'Quantity', 'Total Amount']
    attributes = %w{ po_number m_name s_name c_name price quantity total_amount}

    CSV.generate(headers: true) do |csv|
      csv << header

      all.each do |orderdetail|
        csv << attributes.map{ |attr| orderdetail.send(attr) }
      end
    end
  end
  #-----------
end
