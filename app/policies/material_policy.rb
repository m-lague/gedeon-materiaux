class MaterialPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  def edit?
    user.admin?  # Seuls les administrateurs peuvent éditer un matériau
  end

  def destroy?
    user.admin?  # Seuls les administrateurs peuvent supprimer un matériau
  end
end
