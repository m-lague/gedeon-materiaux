class AddUserIdToMaterials < ActiveRecord::Migration[7.0]
  def change
    add_reference :materials, :user, null: false, foreign_key: true
  end
end
