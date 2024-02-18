class MaterialPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # Tout le monde peut voir la liste des matériaux
    end
  end

  def create?
    true# Un utilisateur connecté peut créer un matériel
  end

  def show?
    true # Tout le monde peut voir un matériau
  end

  def update?
    user && (user.admin? || record.user == user) # Seuls les administrateurs peuvent mettre à jour un matériel
  end

  def destroy?
    user && user.admin? # Seuls les administrateurs peuvent supprimer un matériel
  end
end
