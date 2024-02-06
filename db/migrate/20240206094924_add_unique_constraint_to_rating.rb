class AddUniqueConstraintToRating < ActiveRecord::Migration[7.0]
  def change
    add_index :ratings, [:user_id, :material_id], unique: true
  end
end
