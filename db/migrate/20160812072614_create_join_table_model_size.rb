class CreateJoinTableModelSize < ActiveRecord::Migration[5.0]
  def change
    create_join_table :models, :sizes do |t|
      # t.index [:model_id, :size_id]
      # t.index [:size_id, :model_id]
    end
  end
end
