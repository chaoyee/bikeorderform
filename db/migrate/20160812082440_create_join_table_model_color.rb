class CreateJoinTableModelColor < ActiveRecord::Migration[5.0]
  def change
    create_join_table :models, :colors do |t|
      # t.index [:model_id, :color_id]
      # t.index [:color_id, :model_id]
    end
  end
end
