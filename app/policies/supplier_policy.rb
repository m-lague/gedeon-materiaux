class SupplierPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    user.present? # Un utilisateur connecté peut créer un matériel
  end

  def show?
    true
  end

  def update?
    user && user.admin?
  end

  def destroy?
    update?
  end
end
