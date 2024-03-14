class CreateUpvotes < ActiveRecord::Migration[7.0]
  def change
    create_table :upvotes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, polymorphic: true, null: false

      t.timestamps
    end
    add_index :upvotes, [:user_id, :item_type, :item_id], unique: true
  end
end
