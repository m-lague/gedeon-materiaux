class AddLinkToSuppliers < ActiveRecord::Migration[7.0]
  def change
    add_column :suppliers, :affiliate_link, :string
  end
end
