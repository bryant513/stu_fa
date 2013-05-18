class AdminRole < ActiveRecord::Base
  attr_accessible :name, :admin_permission_ids

  has_and_belongs_to_many :admin_users
  has_and_belongs_to_many :admin_permissions
end
