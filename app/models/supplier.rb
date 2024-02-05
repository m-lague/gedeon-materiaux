class Supplier < ApplicationRecord
  has_many :material_suppliers, dependent: :destroy
  has_many :materials, through: :material_suppliers
end
