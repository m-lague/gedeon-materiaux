class CreateMaterialSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :material_suppliers do |t|
      t.references :material, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
