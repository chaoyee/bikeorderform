class CreateOrderdetails < ActiveRecord::Migration[5.0]
  def change
    create_table :orderdetails do |t|
      t.integer :order_id
      t.integer :model_id
      t.integer :size_id
      t.integer :color_id
      t.decimal :price, default: 0
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
