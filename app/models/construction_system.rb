class ConstructionSystem < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
