class ConstructionSystemPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true # tout le monde
  end

  def show?
    true # Tout le monde peut voir un systeme constructif
  end

  def update?
    user && (user.admin? || record.user == user) # Seuls les administrateurs et les créateurs peuvent mettre à jour un syteme consrtuctif
  end

  def destroy?
    user && user.admin? # Seuls les administrateurs peuvent supprimer un système constructif
  end
end
