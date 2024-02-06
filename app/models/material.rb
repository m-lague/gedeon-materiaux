class Material < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :material_suppliers, dependent: :destroy
  has_many :suppliers, through: :material_suppliers

  validates :user_id, uniqueness: { scope: :material_id, message: "Vous avez déjà voté pour ce matériau" }

  

  def average_rating
    if ratings.any?
      average = ratings.average(:score).to_f
      sprintf('%.2f', average)
    else
      0
    end
  end
end
