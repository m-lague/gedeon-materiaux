class AddReferencesUserToConstructionSystems < ActiveRecord::Migration[7.0]
  def change
    add_reference :construction_systems, :user, null: false, foreign_key: true
  end
end
