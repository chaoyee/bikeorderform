class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :po_number
      t.date :shipment_require_date
      t.date :order_date
      t.string :ship_to
      t.text :reference

      t.timestamps
    end
  end
end
