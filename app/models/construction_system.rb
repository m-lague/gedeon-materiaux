class ConstructionSystem < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :material_construction_systems, dependent: :destroy
  has_many :materials, through: :material_construction_systems
  has_many :upvotes, as: :item

  belongs_to :user

  has_rich_text :description
  has_one_attached :image
end
