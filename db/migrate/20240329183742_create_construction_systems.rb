class CreateConstructionSystems < ActiveRecord::Migration[7.0]
  def change
    create_table :construction_systems do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :description

      t.timestamps
    end
  end
end
