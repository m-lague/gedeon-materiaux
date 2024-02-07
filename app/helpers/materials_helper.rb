module MaterialsHelper

  def link_destroy(material)
    link_to "Supprimer", material, method: :delete, data: { confirm: "Êtes-vous sûr?" }, class: "btn btn-outline-danger" if policy(material).destroy?
  end

  def link_edit(material)
    link_to "Modifier", edit_material_path(material), class: "btn btn-outline-warning" if policy(material).update?
  end
end
