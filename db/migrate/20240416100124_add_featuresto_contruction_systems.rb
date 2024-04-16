class AddFeaturestoContructionSystems < ActiveRecord::Migration[7.0]
  def change
    add_column :construction_systems, :features, :text, default: "liste des caractéristiques", null: false

  end
end
