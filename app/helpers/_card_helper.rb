module CardHelper

  def link_destroy(item)
    link_to "Supprimer", item, data: { turbo_method: :delete, confirm: "Êtes-vous sûr ?" } if policy(item).destroy?
  end

  def link_edit(item)
    link_to "Modifier", [:edit, item], data: {turbo_frame: "content"} if policy(item).update?
  end


end
