class AddUpvotesCountToConstructionSystem < ActiveRecord::Migration[7.0]
  def change
    add_column :construction_systems, :upvotes_count, :integer, default: 0, null: false
  end
end
