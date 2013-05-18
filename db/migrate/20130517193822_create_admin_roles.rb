class CreateAdminRoles < ActiveRecord::Migration
  def change
    create_table :admin_roles do |t|
      t.string :name, :null => false
    end
    create_table :admin_roles_admin_users do |t|
      t.integer :admin_role_id
      t.integer :admin_user_id
    end
    add_index :admin_roles_admin_users, [:admin_role_id, :admin_user_id], :name => 'idx_roles_users_id'
  end
end
