class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :efficiency
      t.decimal :cost

      t.timestamps
    end
  end
end
