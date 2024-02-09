module SuppliersHelper
  def link_destroy_supplier(supplier)
    link_to "Supprimer", supplier, method: :delete, data: { confirm: "Êtes-vous sûr?" }, class: "btn btn-danger" if policy(supplier).destroy?
  end

  def link_edit_supplier(supplier)
    link_to "Modifier", edit_supplier_path(supplier), class: "btn btn-outline-warning" if policy(supplier).update?
  end
end
