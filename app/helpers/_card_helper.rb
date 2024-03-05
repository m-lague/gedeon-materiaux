module CardHelper

  def link_destroy(item)
    link_to "Supprimer", item, method: :delete, data: { confirm: "Êtes-vous sûr?" }, class: "" if policy(item).destroy?
  end

  def link_edit(item)
    link_to "Modifier", [:edit, item], class: "" if policy(item).update?
  end


end
