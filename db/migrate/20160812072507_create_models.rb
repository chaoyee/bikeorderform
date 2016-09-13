class CreateModels < ActiveRecord::Migration[5.0]
  def change
    create_table :models do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
