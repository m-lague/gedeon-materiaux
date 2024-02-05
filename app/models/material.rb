class Material < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :material_suppliers, dependent: :destroy
  has_many :suppliers, through: :material_suppliers
end
