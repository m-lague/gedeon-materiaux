class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, default: 1, null: false

    # Ajoute une contrainte pour s'assurer que le rôle est valide
    change_column_default :users, :role, from: nil, to: 1

    # Ajoute un index pour accélérer les requêtes basées sur le rôle
    add_index :users, :role

    # Utilise un enum pour définir les valeurs possibles du champ de rôle
    # Les valeurs par défaut sont :free_user
    # Cela permet d'utiliser des méthodes comme user.admin?, user.free_user?, user.paying_user?
    User.update_all(role: :free_user)
  end
end
