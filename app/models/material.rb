class Material < ApplicationRecord

  has_many :ratings, dependent: :destroy
  has_many :material_suppliers, dependent: :destroy
  has_many :suppliers, through: :material_suppliers
  has_many :upvotes, as: :item
  has_many :material_construction_systems, dependent: :destroy
  has_many :construction_systems, through: :material_construction_systems

  belongs_to :user

  has_rich_text :description
  has_one_attached :image


  def average_rating
    if ratings.any?
      average = ratings.average(:score).to_f
      sprintf('%.2f', average)
    else
      0
    end
  end
end
