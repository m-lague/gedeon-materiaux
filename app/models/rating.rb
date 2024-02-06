class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :material

  validates :user_id, uniqueness: { scope: :material_id, message: "Vous avez déjà voté pour ce matériau" }


end
