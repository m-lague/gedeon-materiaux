class CreateMaterialConstructionSystems < ActiveRecord::Migration[7.0]
  def change
    create_table :material_construction_systems do |t|
      t.references :material, null: false, foreign_key: true
      t.references :construction_system, null: false, foreign_key: true

      t.timestamps
    end
  end
end
