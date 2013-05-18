class CreateAdminPermissions < ActiveRecord::Migration
  def change
    create_table :admin_permissions do |t|
      t.string :resource,       :null => false
      t.string :can,            :null => false
      t.string :visible_fields, :null => false, :default => 'all'
    end
    create_table :admin_permissions_admin_roles do |t|
      t.integer :admin_permission_id
      t.integer :admin_role_id
    end
    add_index :admin_permissions_admin_roles, [:admin_permission_id, :admin_role_id], :name => 'idx_permissions_roles_id'
  end
end
